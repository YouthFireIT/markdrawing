@php
use App\AttributeSet;
use App\Attribute;
use App\Brand;
use App\Review;
use App\Cart;
use App\Shipping;
use App\City;
use App\Product;
use App\ProductImage;

$cities = City::orderBy('priority', 'asc')->get();
$shippingcharge = Shipping::find(1);

$carts = new Cart;
$carts = $carts->carts();
$carts = Session::get('product');

@endphp

@extends('frontend.layouts.master.app')
@section('content')
<div class="cart-wrapper py-5">
  <div class="container">
      <div class="col-12 text-center mb-4">
          <h1 class="pc-headding">Your cart</h1>
          <a class="pc-shopping" href="products.html">Continue shopping</a>
      </div>
      <div class="col-12">
          <div class="row text-center cart-bg1">
              <div class="col-lg-6 pr-0">
                  <p class="pc-product pr-0">Product</p>
              </div>
              <div class="col-lg-2 p-0">
                  <p class="pc-price">Price</p>
              </div>
              <div class="col-lg-2 p-0">
                  <p class="pc-quantity">Quantity</p>
              </div>
              <div class="col-lg-2 pl-0">
                  <p class="pc-total">Total</p>
              </div>
          </div>
      </div>



      @php
        if (Session::has('product')) {
        $cart_counts = count(array_keys($carts['id'])); $total_products =0;
        }else {
          $cart_counts = 0;
        }
      @endphp

      @for($i = 0; $i < $cart_counts; $i++)
        @php
          if (isset($carts['person'][$i])) {
            $total_products += $carts['person'][$i];
          }
        @endphp
      @endfor

      @php
        $total_pcire = 0;
        $total_product_price = 0;
      @endphp

      @for($i = 0; $i < $cart_counts; $i++)
        
        @if(isset($carts['person'][$i]))        
          @php
            // $total_pcire += $carts['price'][$i];
            // $total_product_price += $carts['price'][$i];
            $product = Product::find($carts['id'][$i]);
            $product_image = ProductImage::where('product_id',$carts['id'][$i])->first();
          @endphp

          @if(isset($product))
            <div class="col-12">
              <div class="row cart-bg2">

                  <div class="col-lg-2">
                    <a href="" class="product-image">
                      @if(!is_null($product))
                        @if(!is_null($product_image))
                          <img class="pc-cart-img1" src="images/{{ $product_image->image }}" alt="">
                        @else
                          <img class="pc-cart-img1" src="{{asset('images/no-img.jpg') }}" alt="cart">
                        @endif
                      @else
                        This Product not available
                      @endif
                    </a>
                  </div>

                  <div class="col-lg-4">
                      <a href="#" class="pc-cart-Black">{{ $product->title }}</a>
                      <p class="pc-cart-Where">Where are you ordering from? (MUST BE SELECTED 1st): {{ $carts['country'][$i] }} How many people / pets?: {{ $carts['person'][$i] }} person 
                        @if($carts['canvasOption'][$i] != NULL)Add a canvas Option? (pick as many as you like):@endif
                        <?php 
                          $canvases = $carts['canvasOption'][$i];
                          $canvasOptionPrice = 0;
                          if($canvases != NULL) {
                            for($j = 0; $j < count($canvases); $j++){
                              $canvas = Attribute::find($canvases[$j]);
                              $canvasOptionPrice = $canvasOptionPrice + $canvas->amount;
                              if($j == count($canvases)-1){
                                echo $canvas->name;
                              } else {
                                echo $canvas->name." And ";
                              }
                            }
                          }
                        ?>
                        
                        @if($carts['canvasPrint'][$i] != NULL)Add a canvas Print? (pick as many as you like):@endif 
                        <?php 
                          $canvasPrints = $carts['canvasPrint'][$i];                          
                          $canvasPrintPrice = 0;
                          if($canvasPrints != NULL) {
                            for($k = 0; $k < count($canvasPrints); $k++){
                              $canvasPrint = Brand::find($canvasPrints[$k]);
                              $canvasPrintPrice = $canvasPrintPrice + $canvasPrint->amount;
                              if($k == count($canvasPrints)-1){
                                echo $canvasPrint->name;
                              } else {
                                echo $canvasPrint->name." And ";
                              }                            
                            }
                          }
                        ?>
                      </p>
                      <a class="pc-cart-remove" href="{{route('carts.delete',$i)}}"  onclick="return confirm('Are you sure you want to delete this item?');">Remove</a>
                  </div>

                  <div class="col-lg-2">
                    <?php 
                      $price = ($product->price*$carts['person'][$i]) + $canvasOptionPrice + $canvasPrintPrice;
                      $total_pcire = $total_pcire + $price;  
                    ?>
                      <p class="pc-cart-price">$<span id="fixed-price" class="pl-2">{{ $price }}</span></p>
                  </div>
                  <div class="col-lg-2">

                    <div style="
                      max-width: 66px;
                      margin: 0 auto;
                      ">
                      @if($carts['quantity'][$i] < 2)
                      <a href="#" class="counter-minus btn btn-primary disabled">-</a>
                      @else
                      <a href="{{route('carts.updatequantity', ['id'=>$i,'action'=>'minus','dd'=>encrypt($price)])}}" class="counter-minus btn btn-primary quantity_minus" id="quantity_minus">-</a>
                      @endif
                      <input type="text" value="{{$carts['quantity'][$i]}}" name="qtybutton" id="qtybutton">
                      <a href="{{route('carts.updatequantity', ['id'=>$i,'action'=>'plus','dd'=>encrypt($price)])}}" class="counter-plus btn btn-primary quantity_plus">+</a>
                    </div>


                      {{-- <input type="number" class="quantity" value="1" id="quantity{{ $carts['id'][$i] }}" onclick="multiplyBy(`{{ $carts['id'][$i] }}`, `{{ $price }}`)"> --}}
                  </div>




                  <div class="col-lg-2">
                      <p class="pc-cart-total">$<span class="result pl-2" id="result{{ $carts['id'][$i] }}">{{ $price }}</span></p>
                  </div>
              </div>
            </div>          
          @endif
        @endif
      @endfor







      <div class="col-lg-4 offset-8 text-right pt-4 pr-0">
          <span class="pc-discount">Discount Code</span>
          <div class="form-group form-group1 mb-5">
              <input type="text" class="form-control coupon" id="coupon"
                  placeholder="Coupon">
              <button type="button" class="apply-btn">Apply</button>
          </div>
          <div class="cart-subtotal">
              <span class="cart-subtotal-title">Subtotal</span>
              <span class="cart-subtotal-price">$ <span id="result1">{{ $total_pcire }}</span></span>
          </div>
          <p class="cart__shipping">Taxes and <a href="/policies/shipping-policy">shipping</a> calculated at checkout
          </p>
          <div class="cart__submit-controls">
              <input type="submit" name="update" class="btn submit-update"
                  value="Update">
              <a href="check-out.html" class="">
                <input type="submit" name="checkout" class="btn submit-checkout"
                  value="Check out" onclick="">
              </a>
          </div>
      </div>
      <div class="col-lg-12 text-center mt-5">
          <p class="WingetCartNotification">We process all orders
              in GBP. While your cart is currently displayed in BDT you will checkout using GBP at the most
              current exchange rate.
          </p>
      </div>
  </div>
</div>
<script>

$(document).ready(function(){
      $('.quantity_plus').click(function(event) {
        event.preventDefault();

        var plus_url = $(this).attr("href");
        // var price = parseInt($(this).closest(".product-row").find('#mainprice').text());
        var tmpPrice = parseInt($(this).closest(".product-row").find('#mainprice').text());
        var disPrice = parseInt($(this).closest(".product-row").find('#disPrice').val());
        var price = tmpPrice - disPrice;
        var product_total_price_old = parseInt($(this).closest(".product-row").find('#product_total_price').text());
        var product_total_price = product_total_price_old + price;
        var subtotal_final = parseInt($("#subtotal_final").text()) + price;
        var order_final = parseInt($("#order_final").text()) + price;
        document.getElementById('pay_amount').value = order_final;

        var incQty  = parseInt($(this).closest(".product-row").find('#qtybutton').val());
        var originalQty = parseInt($(this).closest(".product-row").find('#originalQty').val());

        if(incQty < originalQty){
          var quantity_total = parseInt($(this).closest(".product-row").find('#qtybutton').val()) + 1;
        }


        const qtotal = () => $(this).closest(".product-row").find('#qtybutton').val(quantity_total);
        const ptotal = () => $(this).closest(".product-row").find('#product_total_price').text(product_total_price);

        console.log($(this).closest(".product-row").find('#qtybutton').val());


        if(incQty < originalQty){
          $.ajax({
                    url: plus_url,   // request url
                    data:{} ,
                    type: 'GET',
                    success: function (data, status, xhr) {// success callback function
                      console.log('success');
                      qtotal();
                      ptotal();
                      $("#subtotal_final").text(subtotal_final);
                      $("#order_final").text(order_final);
                    },
                    error: function() {
                      var message = "Error cart not updated" ;
                      notif({
                        msg: message,
                        type: "error"
                      });
                    }
                  });
        }

      });


      $('.quantity_minus').click(function(event) {
        event.preventDefault();

        var plus_url = $(this).attr("href");
        // var price = parseInt($(this).closest(".product-row").find('#mainprice').text());
        var tmpPrice = parseInt($(this).closest(".product-row").find('#mainprice').text());
        var disPrice = parseInt($(this).closest(".product-row").find('#disPrice').val());
        var price = tmpPrice - disPrice;
        var product_total_price_old = parseInt($(this).closest(".product-row").find('#product_total_price').text());
        var product_total_price = product_total_price_old - price;
        var subtotal_final = parseInt($("#subtotal_final").text()) - price;
        var order_final = parseInt($("#order_final").text()) - price;

        document.getElementById('pay_amount').value = order_final;



        var decQty = parseInt($(this).closest(".product-row").find('#qtybutton').val())
        if(decQty > 1){
          var quantity_total = parseInt($(this).closest(".product-row").find('#qtybutton').val()) - 1;

        } else {
          alert("Minimum limit is 1");
        }

        const qtotal = () => $(this).closest(".product-row").find('#qtybutton').val(quantity_total);
        const ptotal = () => $(this).closest(".product-row").find('#product_total_price').text(product_total_price);





        console.log($(this).closest(".product-row").find('#qtybutton').val());


        if(decQty > 1){
          $.ajax({
                    url: plus_url,   // request url
                    data:{} ,
                    type: 'GET',
                    success: function (data, status, xhr) {// success callback function
                      console.log('success');
                      qtotal();
                      ptotal();
                      $("#subtotal_final").text(subtotal_final);
                      $("#order_final").text(order_final);
                    },
                    error: function() {
                      var message = "Error cart not updated" ;
                      notif({
                        msg: message,
                        type: "error"
                      });
                    }
                  });
        }

      });


      $('.shiping_city').click(function(event) {
        event.preventDefault();

        var city_link = $(this).attr("href");
        var city_name = $(this).text();
        if (city_name == 'Dhaka') {
          var price = $('#dhaka_price').text();
        }else {
          var price = $('#all_bd_price').text();
        }

        var order_final = parseInt($("#subtotal_final").text()) + parseInt(price);

        document.getElementById('pay_amount').value = order_final;

        console.log(city_link, city_name,price);


        $.ajax(
        {
                url: city_link,   // request url
                data:{} ,
                type: 'GET',
                success: function (data, status, xhr) {
                    // success callback function
                    console.log('success');
                    $('.before_city').hide();
                    $('.payment_forms').show();
                    $('.success_city').show().text('Selected shipping city '+city_name+' shipping charge '+price);
                    $('#shipping_charge').text(price);
                    $("#order_final").text(order_final);
                  },
                  error: function() {
                    var message = "Error cart not updated" ;
                    notif({
                      msg: message,
                      type: "error"
                    });
                  }
                });

            // $('#payment_forms').hide();

      });

  // console.log(lastPrice);
  // var lastPrice = document.getElementById('result1').innerHTML;
  // var storePrice = parseInt(lastPrice);
  // localStorage.setItem("lastPrice", storePrice);
  // function multiplyBy(id, price) {
  //   console.log(price);
  //     // var num1 = document.getElementById("fixed-price").innerHTML;
  //     var num2 = document.getElementById('quantity' + id).value;
  //     console.log(num2);
  //     var tmpPrice = price * num2;


  //     var finalPrice = tmpPrice/num2;
  //     document.getElementById('result' + id).innerHTML = tmpPrice;
  //     // console.log(localStorage.getItem("lastPrice"));
  //     // var finalPrice = parseInt(localStorage.getItem("lastPrice")) + (tmpPrice - price)
  //     // localStorage.setItem("lastPrice", finalPrice);
  //     var lastPrice = document.getElementById('result1').innerHTML;
  //     // if()
  //     document.getElementById('result1').innerHTML = parseInt(lastPrice) + parseInt(finalPrice);
  // }
</script>
@endsection