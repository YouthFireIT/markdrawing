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
<div class="checkout-wrapper">
    <div class="container">

        
        <div class="row">
            <div class="col-lg-7 pr-5 border-right pt-5">
                <span class="logo__text heading-1">Markdrawing</span>
                <span class="logo__text heading-2">Information > Shipping > Payment</span>
                <div class="d-flex justify-content-between mt-4">
                    <h3 class="pp-Contact-text">Contact information</h3>
                    <span class="pp-Already-text">Already have an account?<a href="#">Log in</a></span>
                </div> 

                <form class="checkout-form" action="{{route('checkout.store')}}" method="POST">
                    @csrf
                    <div class="form-group">
                        <input type="text" name="email" id="pc-email" class="form-control m-0" placeholder="Email">
                        <label for="" id="email-text"></label>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="emailcheck">
                            <label class="form-check-label" for="">Subscribe to stay up to date on news and exclusive offers via email and text messages</label>
                        </div>
                    </div>
                    <label for="">Shipping address</label>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input type="text" name="first_name" id="pc-firstname" class="form-control"
                                placeholder="First name (optional)">
                        </div>
                        <div class="form-group col-md-6">
                            <input name="last_name" type="text" id="pc-lastname" class="form-control" placeholder="Last name">
                            <label for="" id="lastname-text"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Address">
                        <label for="" id="address-text"></label>
                    </div>
                    <div class="form-group">
                        <input type="text" name="apartment_address" class="form-control" id="inputAddress2"
                            placeholder="Apartment, suite, etc. (optional)">
                    </div>
                    <div class="form-group">
                        <input type="text" name="city" class="form-control" id="inputCity" placeholder="City">
                        <label for="" id="city-text"></label>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <select name="country" id="inputState" class="form-control">
                                <option selected>Country or Region</option>
                                <option>Bangladesh</option>
                                <option>India</option>
                                <option>Pakistan</option>
                                <option>America</option>
                                <option>China</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <input name="postal_code" type="number" class="form-control" id="inputZip" placeholder="Postal code">
                            <label for="" id="postcode-text"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <input name="phone" type="number" name="" id="" class="form-control"
                            placeholder="Mobile phone number for news and exclusive offers">
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck">
                            <label class="form-check-label" for="gridCheck">
                                Check me out
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn checkout-btn">Order Confirm</button>
                </form>
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
                </div>


            </div>
        </div>
    </div>
</div>

@endsection