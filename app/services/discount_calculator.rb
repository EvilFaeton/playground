# frozen_string_literal: true

module DiscountCalculator
  module_function

  def for_product(product, cart)
    discount_rule = product.discount_rule
    return product.price if product.discount_rule.blank?

    expected_amount =
      (cart.cart_products.find_by(product_id: product.id)&.amount || 0) + 1

    eligible =
      case discount_rule.discount_type
      when 'each_item'
        (expected_amount % discount_rule.value).zero?
      when 'bulk'
        expected_amount >= discount_rule.value
      else
        raise 'unknow discount type'
      end
    eligible ? product.price * multiplier(discount_rule.amount) : product.price
  end

  def for_cart_product(cart_product)
    return cart_product.gross_price if cart_product.product.discount_rule.blank?

    product = cart_product.product
    discount_rule = product.discount_rule
    case discount_rule.discount_type
    when 'each_item'
      discounted = cart_product.amount / discount_rule.value
      product.price * multiplier(discount_rule.amount) * discounted + product.price * (cart_product.amount - discounted)
    when 'bulk'
      if cart_product.amount >= discount_rule.value
        cart_product.gross_price * multiplier(discount_rule.amount)
      else
        cart_product.gross_price
      end
    else
      raise 'unknow discount type'
    end
  end

  private_class_method def multiplier(value)
    (100 - value) / 100.0
  end
end
