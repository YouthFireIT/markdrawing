@extends('frontend.layouts.master.app')

@section('content')
    <!-- banner part -->
	<section id="banner_part">
		<div class="conatiner">
			<div class="row p-0 m-0">
				<div class="col-lg-8 p-0 col-md-12">
					<div class="banner_left">
						<h1 class="banner_head">
							<span class="bhead_keyword">Representations</span>
                             from your photographs
						</h1>
						<p class="">
							One of the most excellent things approximately requesting a picture from Mark drawings is the ease of it all. You'll be able take a photo off your phone or camera and transfer it at that point arrange on our site, yes it’s truly that easy.
						</p>
						<p class="">
							As it were put to urge your representations drawn from your photographs. Mark and he's group take your favorite photographs of your top choice individuals and turn them into incredible representations. Not as it were are our representations incredibly shocking, they are too fetched successful with costs from fair 17usd.
						</p>
					</div>
				</div>
				<div class="col-lg-4 p-0 col-md-12">
					<div class="banner_img_wrap">
						<img src="images/main-show-banner.webp" alt="" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
    </section>
    
	<!-- drawing moment part -->
	<section id="drawing_moment">
		<div class="container">
			<div class="row justify-content-center">
				<span class="section_heading pb-5">
					Get your Charlies Drawings moment
				</span>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/83IpYS6Bgk8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
				<div class="col-lg-6">
					<p class="dm_text">
						One of the most unique reasons to get a portrait from your photos with Charlie’s drawings in connecting people who did not get the chance to meet in person. Taking separate photos of people who never got the chance to meet and drawing them into a beautiful portrait is just the perfect way to create an emotional one off gift.
					</p>
					<p class="dm_text">
						Photos can be from separate occasions and even eras. So if it’s an emotional Grandparent / Grandchild portrait or yourself with a much missed family member.
					</p>
				</div>
			</div>
			<div class="row pt-5">
				<div class="col-lg-4">
					<img src="images/dm1.png" alt="" class="img-fluid">
				</div>
				<div class="col-lg-4">
					<img src="images/dm2.png" alt="" class="img-fluid">
				</div>
				<div class="col-lg-4">
					<img src="images/dm3.jpg" alt="" class="img-fluid">
				</div>
			</div>
			<div class="row">
				<div class="col-auto">
					<p class="dm_text text-center padding_c">
						Family portraits are also another great gift for everyone, even the people who are incredibly hard to buy for. The thought of getting the whole family together for long enough to get a portrait drawn brings shivers down most peoples spines. The great thing about our portraits is they can be drawn from separate photos and all done with a click of a button. All you need is a nice snapshot of everyone and we do the rest of the work.
					</p>
				</div>
			</div>
		</div>
    </section>
    
	<!-- Featured Collections -->
	<section id="Featured_Collections" class="Featured_Collections">
		<div class="container">
			<div class="row justify-content-center">
				<span class="section_heading pb-5">
					Featured Collections
				</span>
			</div>
			<div class="row">
                 

            @forelse ($feature_products as $item)
                <div class="col-lg-3 py-3">
                    <a href="#" class="fc_link_item">
                        <div class="fc_item_wrap">
													<?php 
														$image = App\ProductImage::where('product_id', $item->id)->first();	
													?>
                            <img src="{{ asset('/images').'/'.$image->image }}" alt="" class="img-fluid">
                            <p class="py-3">{{ $item->name }}</p>
                            {{-- <div id="star_rating1" start="3" class="text-left d-block"></div> --}}
                            <h2 class="text-center">Tk {{ $item->price }}</h2>
                        </div>
                    </a>
                </div>
            @empty 
            @endforelse 

		</div>
    </section>
    
	<!-- order process part -->
	<section id="order_process">
		<div class="container">
			<div class="row justify-content-center">
				<span class="section_heading pb-5">
					Making an order for your portrait
				</span>
			</div>
			<div class="row justify-content-end">
				<div class="op_content_1">
					<h2 class="op_heading">Select your perfect photos</h2>
					<p class="">When choosing the perfect photographs you ought to consider some things, the most things is merely can see facial subtle elements clearly. Presently these don’t got to be proficient quality since who has that, most smartphones have a pretty exceptional camera nowadays so phone pictures are great. If you have got any ancient photographs coasting around in draws and you need to utilize them, at that point rather than sending them in by post fair take a photo of your ancient photo. This will as a rule permit us to utilize your much-loved cherished photo without gambling it with regal mail.</p>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="op_content_2">
					<h2 class="op_heading">Select your style </h2>
					<p class="">The following most vital thing is to select your representation fashion, here at Mark Drawings we offer a few astounding styles that can select from. Black & White representation pencil This fashion is idealize for decent basic family representations; this fashion is drawn in pencil by hand, cleaned up on pc at that point sent on either tall quality print & canvas. This fashion can be utilized for pictures of individuals who never met and can be made up from partitioned photographs. This fashion takes on normal two weeks to total, you may get a see sent through to your email, which you'll be able endorse to induce your picture on its way.</p>
					<p class=""><strong>Dark & White Representation detailed </strong></p>
					<p class="">This fashion is incredible for individuals who need a life like family representation; this fashion is drawn on a drawing tablet, which is associated, to a tall control pc. This permits us to keep the quality tall and as life like as can be. Too alters are a part simpler to be made in this fashion as it’s not a case of a total redraw. This fashion takes 2 weeks to total and like all our styles you'll get an e-mail preview.  </p>
					<p class=""><strong>Colour Representation Digital </strong></p>
					<p class="">This Colour Representation computerized fashion works flawlessly from your photographs. In truth this has been one of the most excellent venders final year. This fashion is made with a drawing tablet associated to a tall control pc. This representation is at that point carefully drawn to deliver an astounding result, like all our styles in takes approx. 2 weeks to be completed. See out for our mail see, which can be in your inbox.</p>
					<p class=""><strong>Colour Pencil Portrait </strong></p>
					<p class="">Colour Pencil Representation is such an astounding fashion to select, typically hand portrayed and coloured in pencil to allow you an extraordinary wrap up. These take a day or two longer than the others due to the sum of work put in by our group</p>
				 
				</div>
			</div>
			<div class="row justify-content-end">
				<div class="op_content_3">
					<h2 class="op_heading">Arrange online </h2>
					<p>The best and most effortless thing around Mark Drawings is the ease of requesting. Our completely secure site can take card installments at the side your required photographs to create the method inconceivably stretch free. Any questions or issues we have a exceedingly talented group observing our emails and messages 24/7 so fair get in touch with us.</p>
					<p><strong>How much will my representations from photographs cost? </strong></p>
					<p>So you’re likely considering with the sum of work being put in and the client benefit we offer than your representation will fetched the soil? No not at all, our costs begin from fair £15 per individual. All dark and white styles taken a toll fair £15 per individual, while colour computerized is fair £16 per individual; Colour pencil representation is £20 per person. </p>
					<p><strong> What happens in the event that I don’t like my Portrait? </strong></p>
					<p>The thing almost craftsmanship is that it is exceptionally subjective, particularly when it’s a drawing of your adored ones, as lets confront it you know them a parcel superior than us. So what we offer is step by step bolster until your upbeat together with your drawing. With the sum of work that goes into each drawing furthermore the consistent back we do have a no discount approach, as there's basically no require.</p>
				</div>
            </div>
            
			<div class="row justify-content-center pt-5">
				<span class="section_heading">
					What Our Clients Say
				</span>
			</div>
			<div class="row justify-content-center pt-4">
				<div id="owl-demo" class="owl-carousel">

					<div class="item">
						<img src="images/1.webp" alt="" class="">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/2.webp" alt="" class="">
						<p class="pt-3"><strong>Sandra Inglis - Facebook Review</strong></p>
						<p class="">
							Just got my finished artwork. Was in tears when I saw it. I predict tears on Christmas morning when my mum sees this amazing picture of my dad and his granddaughters who were just little when he died. It's turned out so much better than I hoped
						</p>
						<a href="#" class="owl_button">
							<button class="btn btn-success shadow-none text-capitalize">Order here</button>
						</a>
					</div>
					<div class="item">
						<img src="images/3.webp" alt="" class="">
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
		</div>
    </section>
@endsection