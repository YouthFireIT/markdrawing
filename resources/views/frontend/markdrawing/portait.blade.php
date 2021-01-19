@extends('frontend.layouts.master.app')

@section('content')
    <!-- page name banner -->
	<section id="page_banner_portrait">
		<div class="row">
			<div class="col-lg-6">
				<div class="content_wrap_cc">
					<p class="pt_heading c_center">
						Markdrawing
					</p>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="content_wrap_cc">
					<p class="pt_heading_t c_center">
						Home Page
					</p>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Collections -->
	<section id="Featured_Collections">
		<div class="container">
			<div class="row">
				<div class="col-auto">
					<div class="c_filtering">
						<span class="d-inline-block pr-3 sort_by">Sort By</span>
						<select name="sort_by" id="">
							<option value="featured" selected="selected">Featured</option>
							<option value="best-selling">Best selling</option>
							<option value="alphabetically-a-z">Alphabetically, A-Z</option>
							<option value="alphabetically-z-a">Alphabetically, Z-A</option>
							<option value="price-low-to-high">Price, low to high</option>
							<option value="date-old-to-new">Date, old to new</option>
							<option value="date-new-to-old">Date, new to old</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p1.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating1" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p2.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating2" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p3.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating3" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p4.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating4" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p5.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating5" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
				<div class="col-lg-3 p-2">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p6.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating6" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
@endsection