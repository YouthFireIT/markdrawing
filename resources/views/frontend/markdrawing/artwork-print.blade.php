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
						Artwork prints
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Artwork prints -->
	<section id="Artwork_print">
		<div class="container">
			<div class="row">
				<div class="col-auto">
					<div class="c_filtering">
						<button class="ap_button1 btn">
							<i class="fas fa-th-large ap_button_color"></i>
						</button>
						<button class="ap_button2 btn">
							<i class="fas fa-list-ul"></i>
						</button>
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
			<div class="row justify-content-center">
				<p class="ap_text_body">Sorry, there are no products in this collection</p>
			</div>
		</div>
	</section> 
@endsection