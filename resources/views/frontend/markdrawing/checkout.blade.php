@extends('frontend.layouts.master.app')

@section('content')
<div class="checkout-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 pr-5 border-right pt-5">
                <span class="logo__text heading-1">charliesdrawings</span>
                <span class="logo__text heading-2">Information > Shipping > Payment</span>
                <div class="d-flex justify-content-between mt-4">
                    <h3 class="pp-Contact-text">Contact information</h3>
                    <span class="pp-Already-text">Already have an account?<a href="login.html">Log in</a></span>
                </div> 

                <form class="checkout-form" onsubmit="return checkoutpage()">
                    <div class="form-group">
                        <input type="text" name="" id="pc-email" class="form-control m-0" placeholder="Email">
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
                            <input type="text" id="pc-firstname" class="form-control"
                                placeholder="First name (optional)">
                        </div>
                        <div class="form-group col-md-6">
                            <input type="text" id="pc-lastname" class="form-control" placeholder="Last name">
                            <label for="" id="lastname-text"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" id="pc-address" class="form-control" id="inputAddress" placeholder="Address">
                        <label for="" id="address-text"></label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="inputAddress2"
                            placeholder="Apartment, suite, etc. (optional)">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="inputCity" placeholder="City">
                        <label for="" id="city-text"></label>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <select id="inputState" class="form-control">
                                <option selected>Country or Region</option>
                                <option>Bangladesh</option>
                                <option>India</option>
                                <option>Pakistan</option>
                                <option>America</option>
                                <option>China</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <input type="number" class="form-control" id="inputZip" placeholder="Postal code">
                            <label for="" id="postcode-text"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="number" name="" id="" class="form-control"
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
                    <button type="submit" class="btn checkout-btn">Continue to shipping</button>
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

                <div class="product-first mb-4">
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img class="img-fluid" src="images/checkout-img/Untitleddesign_16_small.png"
                                        alt="">
                                    <span class="pp-top-left">1</span>
                                </div>
                                <div class="col-lg-9 pr-0">
                                    <span class="product_description_name">Black &amp; White Pastel Shade</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <p class="pp-price-x">£17.50</p>
                        </div>
                    </div>
                </div>
                <div class="product-first">
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="row">
                                <div class="col-lg-3">
                                    <img class="img-fluid" src="images/checkout-img/product-blank.png" alt="">
                                    <span class="pp-top-left">1</span>
                                </div>
                                <div class="col-lg-9 pr-0">
                                    <span class="product_description_name">Black & White Pastel Shade -
                                        Selections</span>
                                    <p class="pp-price-y">Where are you ordering from? (MUST BE SELECTED 1st): USA
                                        🇺🇸 <br>
                                        How many people / pets?: 1 person <br> Add a canvas print? (pick as many as
                                        you
                                        like): 8" x 10" | £23.02</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <p class="pp-price-x">£23.02</p>
                        </div>
                    </div>
                </div>
                <div class="gift-card-wrapper">
                    <div class="input-group">
                        <input type="text" name="" class="gift-box" id="gift-box" placeholder="">
                        <input class="gift-btn" id="gift-btn" type="button" value="Apply">
                    </div>
                </div>
                <div class="total-line-table mt-4 pt-3">
                    <div class="total-line-table-text d-flex justify-content-between">
                        <p>Subtotal</p>
                        <p>£40.52</p>
                    </div>
                    <div class="total-line-table-text d-flex justify-content-between">
                        <p>Shipping Shipping costs</p>
                        <p>Calculated at next step</p>
                    </div>
                    <div class="total-line-table-text total-line-table-text1 d-flex justify-content-between">
                        <p>Total</p>
                        <p class="pp-font">£40.52</p>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

@endsection