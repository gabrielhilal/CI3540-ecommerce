class LineItemsController < ApplicationController

  def create
    #product stores the product received from the post action "add to cart" button (based on the product_id).
    product = Product.find(params[:product_id])
    #if the found product exists in the current_cart, we add it to the line_item
    line_item = current_cart.line_items.find_by_product_id(product)
    #here we check if the line_item was created (check if the found product exists in the current cart)
    if line_item
      #if line_item exists, we add 1 to (increment) the item_line quantity in the current cart.
      line_item.quantity += 1
      #try to save the line_item with new quantity.
      if line_item.save
        #if saved display confirmation and redirect to the application INDEX action (store_path).
        flash[:success] = 'Another ' + product.title + ' added to the cart.'
        redirect_to store_path
      else
        #if it is not saved display message below and redirect to INDEX action (store_path).
        flash[:error] = 'Unexpected error, please try again latter.'
        redirect_to store_path
      end
    else
      # if the line_item wasn't created before (the product didn't exist in the current cart) we create a new.
      #here we create a new line_item based in the "product" and add it to the current cart.
      line_item = current_cart.line_items.build(product: product)
      if line_item.save
        #if saved display confirmation and redirect to the application INDEX action (store_path).
        flash[:success] = product.title + ' added to the cart.'
        redirect_to store_path
      else
        #if it is not saved display message below and redirect to INDEX action (store_path).
        flash[:error] = 'Unexpected error, please try again latter.'
        redirect_to store_path
      end
    end
  end

  def destroy
    #to delete a line_item, first we find it by its id.
    line_item = LineItem.find(params[:id])
    #here we check if there is more that 1 product (if quantity is grater than 1)
    if line_item.quantity > 1
      #if yes we remove 1 from the line_item quantity (decrement), so each time the "delete" is clicked,
      #                           the user decrease the quantity by 1 until the quantity value became 1.
      line_item.quantity -= 1
      #than we save the line_item with the new quantity.
      if line_item.save
        #if saved display confirmation and redirect to the application INDEX action (store_path).
        flash[:success] = '1 ' + line_item.product.title + ' removed from your cart.'
        redirect_to store_path
      else
        #if it is not saved display message below and redirect to INDEX action (store_path).
        flash[:error] = 'Unexpected error, please try again latter.'
        redirect_to store_path
      end
    #if the line_item is not "> 1", so when it became 1, we need to destroy (delete) the line instead of
                                                                         # decrement its quantity value.
    else
      #we destroy the line, display the confirmation and redirect to the application INDEX action (store_path).
      line_item.destroy
      flash[:success] = line_item.product.title + ' removed from your cart.'
    redirect_to store_path
    end
  end
end
