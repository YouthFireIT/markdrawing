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

      if (Session::has('product')) {
      $cart_counts = count(array_keys($carts['id'])); $total_products =0;
      }else {
        $cart_counts = 0;
      }
@endphp

@extends('frontend.layouts.master.app')

@section('content')
<div class="checkout-wrapper">
    <div class="container">


        <div class="row">
            <div class="col-lg-7 pr-5 border-right pt-5">
                <span class="logo__text heading-1">Markdrawing</span>
                <div class="d-flex justify-content-between mt-4">
                    <span class="pp-Already-text">Already have an account?<a href="#">Log in</a></span>
                </div>
                <ul class="policy-list">
                    <li class="policy-list__item ">
                        <a href="">Refund policy</a> <a href="">Shipping policy</a>
                    </li>
                    <li class="policy-list__item ">
                        <a href="">By checking this box, I consent to receive automated marketing from [YOUR STORE NAME] by email and text message at the email address and mobile number provided. Consent is not a condition to purchase. </a>
                    </li>
                    <li class="policy-list__item ">
                        <a href="">Terms of service</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-5 bg-light pl-5 pt-5">
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


                <div class="product-first mb-4">
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-3">
                                    @if(!is_null($product))
                                    @if(!is_null($product_image))
                                    <img class="img-fluid" src="images/{{ $product_image->image }}" alt="">
                                    @else
                                    <img class="pc-cart-img1" src="{{asset('images/no-img.jpg') }}" alt="cart">
                                    @endif
                                    @else
                                        This Product not available
                                    @endif

                                </div>
                                <div class="col-lg-9 pr-0">
                                    <span class="product_description_name">{{ $product->title }}</span>
                                    <p class="pp-price-y">Where are you ordering from? (MUST BE SELECTED 1st): {{ $carts['country'][$i] }}<br>
                                        How many people / pets?: {{ $carts['person'][$i] }} person <br>
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
                                        ?> </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <p class="pp-price-x">@php
                              $pricess =  Session::get('product')

                            @endphp
                            ${{ $pricess['price'][$i] }}
                        </p>
                        </div>
                    </div>
                </div>

                @endif
                @endif
              @endfor






                {{-- <div class="gift-card-wrapper">
                    <div class="input-group">
                        <input type="text" name="" class="gift-box" id="gift-box" placeholder="">
                        <input class="gift-btn" id="gift-btn" type="button" value="Apply">
                    </div>
                </div> --}}

                <div class="total-line-table mt-4 pt-3">
                    <div class="total-line-table-text d-flex justify-content-between">
                        <p>Subtotal</p>
                        <p>${{ $pricess =  Session::get('totalPrice') }}</p>
                    </div>
                    <div class="total-line-table-text d-flex justify-content-between">
                        <p>Shipping Shipping costs</p>
                        <p>Calculated at next step</p>
                    </div>
                    <div class="total-line-table-text total-line-table-text1 d-flex justify-content-between">
                        <p>Total</p>
                        <p class="pp-font">${{ $pricess =  Session::get('totalPrice') }}</p>
                    </div>
                    <form class="checkout-form" action="https://www.2checkout.com/checkout/purchase" method="POST">
                        @csrf
                        <input type='hidden' name='sid' value='250685818316' />
                        <input type='hidden' name='mode' value='2CO' />

                        @for($i = 0; $i < $cart_counts; $i++)

                            @if(isset($carts['person'][$i]))
                                @php
                                  $product = Product::find($carts['id'][$i]);
                                  $pricess =  Session::get('product')
                                @endphp
                                @if(isset($product))
                                    <input type='hidden' name='li_{{ $i }}_name' value='{{ $product->title }}' />
                                    <input type='hidden' name='li_{{ $i }}_price' value='{{ $pricess['price'][$i] }}' />
                                @endif
                            @endif
                        @endfor

                        <input type='hidden' name='demo' value='Y' />
                        <button type="submit" class="btn btn-sm btn-success mb-4">Order Confirm</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
