@extends('frontend.layouts.master.app')
@section('style')
<style>
    .owl_button{
        display: none;
    }
    .item{background: #fff;border-radius: 10px; padding:30px;box-shadow: 0 0 10px #00000050;transform: scale(.9)}
    .item img{width: 120px;height:120px;border-radius: 50%;object-fit: cover;border: 8px ridge #fff;box-shadow: 0 0 10px #00000050}
</style>
@endsection

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
						Family Portrait
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Family Portrait -->
	<section id="family_portrait">
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
				<div class="col-lg-3">
					<img src="images/family_potrait.jpg" alt="" class="img-fluid">
				</div>
				<div class="col-lg-9">
					<p class="fp_text">Here at Mark Drawings we accept each family ought to be able to have a flawlessly hand drawn representation which is why we offer dazzling work of art at such reasonable prices. From fair £15 per individual we'll create a dazzling family representation that you simply will treasure until the end of time! Ready to draw any estimate family, no matter how huge or little, extraordinary grandmothers to minor babies and indeed our fuzzy companions can all be drawn together to create a really extraordinary family representation.</p>
					<p class="fp_text">What’s more, we draw straight from your photographs and can indeed draw family individuals together from isolated photographs and make it see as in spite of the fact that everybody is together!</p>
					<p class="fp_text">We too offer extra prints and canvases of your family representation so for a little extra charge, you'll have copy duplicates of your magnum opus to allow to the entire family as gifts! A family representation may be a one of a kind individual gift that's beyond any doubt to be adored and acknowledged by everybody, indeed fastidious Uncle Ernie! Ordering might not be easier, all you have got to do is upload your photos through our site, select the sum of individuals and the size you'd  like for your portrait and after that checkout! Once your drawing is complete, we are going send you an mail duplicate of it so you'll be able favor it, once you’re upbeat with it, we are going send it straight to you so your family representation is prepared to require pride of put on your divider!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-auto">
					<p class="fp_text">All we ought to draw your lovely family portrait is sweet quality clear photographs. These don’t got to be proficient quality by any implies, indeed clear photographs taken on your phone will be idealize!</p>
                    <p class="fp_text">Mark Drawings has presently been running for over three a long time! We have an astonishing group of greatly gifted specialists and an fabulous client benefit group. This is often why we have so numerous clients that keep coming back to us and adore each portrait drawing as much as their first! All you have got to do to see prove of this can be see on our Facebook page, we have hundreds of guest posts clearing out us such lovely surveys and we appreciate each single one! Feel free to head over to our Facebook and Instagram pages, you may see incredible client audits, parts of illustrations of family representation s and other work, in some cases we discharge uncommon bargains and markdown codes only for fans of our pages and we indeed do competitions and giveaways so its well worth joining our 240,000 fans and giving us a like and a take after!</p>
                    
                    <p class="fp_text">All we need to draw your beautiful family portrait is good quality clear photos. These don’t need to be professional quality by any means, even clear photos taken on your phone will be perfect!</p> 
				</div>
			</div>
			<div class="row">
				<div class="col-lg-9">
					<p class="fp_text">We don’t fair do family representations, ready to do anything from a wedding representation, drawings of your top pick occasion depictions and anything else you'll come up with! We have done a few incredible themed pictures within the past, in the event that you have got any thoughts, feel free to drop us a message and we’ll see what we will do!</p>
				</div>
				<div class="col-lg-3">
					<img src="images/fp_img2.jpg" alt="" class="img-fluid">
				</div>
			</div>
		</div>
    </section>
    
	<!-- testimonials part -->
	<section id="testomonial_part">
		<div class="container">
			<div class="row">
				<div class="col-auto ml-auto">
					<h6 class="">Here are some of the lovely customer testimonials we have received from customers who have purchased a family portrait:</h6>
				</div>
			</div>
			<div class="row justify-content-center pt-4">
				<div id="owl-demo" class="owl-carousel">

					<div class="item">
						<img src="images/dm3.jpg" alt="" class="img-fluid">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/dm2.png" alt="" class="img-fluid">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/dm1.png" alt="" class="img-fluid">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/dm4.png" alt="" class="img-fluid">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/dm5.png" alt="" class="img-fluid">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
				</div>
			</div>
			<div class="row pt-5">
				<div class="col-auto">
					<p class="fp_text text-center">Such lovely feedback we will never get bored of receiving! If you decide to order a family portrait, please get in touch once you’ve received it and let us know what you think! Just select which style you prefer below ⬇️⬇️⬇️⬇️⬇️</p>
				</div>
			</div>
		</div>
    </section>
    
	<!-- portrait packages -->
	<section id="potrait_pac">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-auto">
					<h4 class="ppac_heading">Just select which style you prefer below</h4>
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
			<div class="row justify-content-around pt-2">
				<div class="col-lg-3">
					<a href="#" class="fc_link_item">
						<div class="fc_item_wrap">
							<img src="images/p5.png" alt="" class="img-fluid">
							<p class="py-3">Black & White Portrait Detailed</p>
							<div id="star_rating5" start="3" class="text-left d-block"></div>
							<h2 class="text-center">Tk 2012.34</h2>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
@endsection