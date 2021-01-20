@extends('frontend.layouts.master.app')

@section('content')
     
	<!-- page name banner -->
	<section id="page_banner_portrait">
		<div class="row">
			<div class="col-lg-6">
				<div class="content_wrap_cc">
					<p class="pt_heading c_center">
						Charliesdrawings
					</p>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="content_wrap_cc">
					<p class="pt_heading_t c_center w-100 text-center">
						Black & White Portrait Detailed
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Menu area  -->

	<div class="menu-area mt-5 pb-3">
		<div class="container">
			<nav class="menu">
					<ul class="nav">
						<li><a href="#">Home  <i class="fas fa-angle-right"></i></a></li>
						<li><a href="#">Home Page  <i class="fas fa-angle-right"></i></a></li>
						<li><a href="#">Black & White Portrait Detailed </a></li>
					</ul>
			</nav>
		</div>
	</div>

	<!-- detail area   -->
	<div class="detail-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-4"> 
					<div class="detail-img">
                        @php
                        $image = App\ProductImage::where('product_id', $product->id)->first();	
                        @endphp
						<img src="{{ asset('/images').'/'.$image->image }}" class="big_img rounded">
						<ul>
                            @php
                                $images = App\ProductImage::where('product_id', $product->id)->get();	
                            @endphp 
                            @forelse ($images as $item)
                            <li><img src="{{ asset('/images').'/'.$item->image }}" class="small_img img-thumbnail"></li>
                            @empty
                                
                            @endforelse 
							
	 
						</ul>
					</div> 
				</div>

				<div class="col-lg-6">
					<h3>Black & White Portrait Detailed</h3>
					<div class="detail-review">
						<ul class="nav">
								<li><a href="#"><i class="fas fa-star"></i></a></li>
								<li><a href="#"><i class="fas fa-star"></i></a></li>
								<li><a href="#"><i class="fas fa-star"></i></a></li>
								<li><a href="#"><i class="fas fa-star"></i></a></li>
								<li><a href="#"><i class="fas fa-star"></i></a></li>
								<li><a href="#"><span>(45)</span></a></li>
						</ul>
					</div>

					<div class="detail-amount">
						<h3>$ {{$product->price}}</h3>
					</div>

					<p><u>Shipping</u> calculated at checkout.</p>

					<p>{!! $product->description !!} </p>

					<h6>Order in 3 easy steps?</h6>

					<div class="detail-step">
						<ul>
							<li><p>Choose the amount of people you would like drawing?</p> </li>
							<li><p>Add the photos of the people you would like drawing by uploading them below. (if you have any problems with this you can upload them to our new art studio portal which you will get a login to once you have ordered)  </p></li>
							<li><p>Choose your delivery method.</p> </li>
						</ul>
					</div>

					<form>
						<div class="form-group">
							<label for="Programm">Where are you based? (MUST BE SELECTED):</label>
							<select id="Programm" class="form-control">
								<option value="1" selected="selected">Choose One</option>
								<option value="2">United Kingdom GB</option>
								<option value="3">USA US</option>
								<option value="4">Australia AUS</option>
							</select>
						</div>

						<div class="form-group">
							<label for="people">How many people / pets?:</label>
							<select id="people" class="form-control">
								<option value="1" selected="selected">Choose One</option>
								<option value="2">1 Person</option>
								<option value="3">2 People</option>
								<option value="4">3 People</option>
								<option value="5">4 People</option>
								<option value="6">5 People</option>
								<option value="7">6 People</option>
								<option value="8">7 People</option>
								<option value="9">8 People</option>
								<option value="10">9 People</option>
								<option value="11">10 People</option>
								<option value="12">11 People</option>
								<option value="13">12 People</option>
								<option value="14">13 People</option>
								<option value="15">14 People</option>
								<option value="16">15 People</option>
								<option value="17">16 People</option>
								<option value="18">17 People</option>
								<option value="19">18 People</option>
								<option value="20">19 People</option>
								<option value="21">20 People</option>
								<option value="22">21 People</option>
								<option value="23">22 People</option>
								<option value="24">23 People</option>
								<option value="25">24 People</option>
								<option value="26">25 People</option>
								<option value="27">26 People</option>
								<option value="28">27 People</option>
								<option value="29">28 People</option>
								<option value="30">29 People</option>
								<option value="31">30 People</option>
							</select>
						</div>

						<div class="form-group">
							<label for="people">Canvas Options? (pick as many as you like): </label><br>

							@forelse (App\Attribute::all() as $item)
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="{{$item->id}}" value="{{$item->amount}}">
								<label class="form-check-label" for="{{$item->id}}">{{$item->name}}</label>
								</div>
							@empty
								
							@endforelse
							
						 
						</div>

						<div class="form-group">
							<label for="people">Add a print?: </label><br>
							@forelse (App\Brand::all() as $item)
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="{{$item->id}}" value="{{$item->amount}}">
								<label class="form-check-label" for="{{$item->id}}">{{$item->name}}</label>
								</div>
							@empty
								
							@endforelse
						</div>

						<div class="form-group">
							<label for="cmnt">Add any notes?</label>
							<textarea id="cmnt" cols="30" rows="4" class="form-control"></textarea>
						</div>



						<div class="img-button">
							<label for="img">Upload an image</label>
							<br>
							<button id="img">Choose image(s)</button>
						</div>
						<br> 
						<div class="cart-button">
							<a href="cart.html" class="">
								<button  type="button">Add To Cart</button>
							</a>
						</div>

					</form>
			</div>
		</div>
	</div>


	<!--   detail review -->
	<div class="discription-review-area mb-5">
		<div class="container">
			<ul class="nav">
				<li><a href="#">Description</a></li>
				<li>/</li>
				<li><a href="#">Review</a></li>
			</ul>

			<hr>
{{-- 
			<span>Ordering a charlies drawing will be one of the most emotional gifts/purchases you will ever make.</span> --}}

			<div class="discription-content">
				{{-- <h6>How long will it take?</h6> --}}
				<p>
                    {!! $product->description !!} 
                </p>
			</div>
 
		
	</div>   
@endsection