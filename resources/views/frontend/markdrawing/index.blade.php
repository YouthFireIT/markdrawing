@extends('frontend.layouts.master.app')

@section('content')
    <!-- banner part -->
	<section id="banner_part">
		<div class="conatiner">
			<div class="row p-0 m-0">
				<div class="col-lg-8 p-0 col-md-12">
					<div class="banner_left">
						<h1 class="banner_head">
							<span class="bhead_keyword">Portraits</span>
							 from your photos
						</h1>
						<p class="">
							The only place to get your Portraits drawn from your photos. Charlie and he’s team take your favourite photos of your favourite people and turn them into fantastic portraits. Not only are our portraits amazingly stunning, they are very cost effective with prices from just £17.50. 
						</p>
						<p class="">
							One of the best things about ordering a picture from Charlie’s drawings is the ease of it all. You can take a photo off your phone or camera and upload it then order on our website, yes its really that easy.
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
                            <img src="images/p1.png" alt="" class="img-fluid">
                            <p class="py-3">Black & White Portrait Detailed</p>
                            <div id="star_rating1" start="3" class="text-left d-block"></div>
                            <h2 class="text-center">Tk 2012.34</h2>
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
					How to order your portrait
				</span>
			</div>
			<div class="row justify-content-end">
				<div class="op_content_1">
					<h2 class="op_heading">Choose your ideal photos</h2>
					<p class="">When choosing the ideal photos you should consider a few things, the main things is that you can see facial details clearly. Now these don’t need to be professional quality because who has that, most smartphones have a pretty outstanding camera today so phone pictures are great.</p>
					<p class="">If you have any old photos floating around in draws and you want to use them, then instead of sending them in by post just take a photo of your old photo. This will usually allow us to use your much-loved treasured photo without risking it with royal mail.</p>
				</div>
			</div>
			<div class="row justify-content-start">
				<div class="op_content_2">
					<h2 class="op_heading">Choose your style</h2>
					<p class="">The next most important thing is to choose your portrait style, here at Charlie’s Drawings we offer some amazing styles that can choose from.</p>
					<p class=""><strong>Black & White portrait pencil </strong></p>
					<p class="">This style is perfect for nice simple family portraits; this style is drawn in pencil by hand, cleaned up on pc then sent on either high quality print & canvas. This style can be used for pictures of people who never met and can be made up from separate photos. This style takes on average two weeks to complete, you will get a preview sent through to your email, which you can approve to get your picture on its way. </p>
					<p class=""><strong>Black & White Portrait detailed</strong></p>
					<p class="">This style is great for people who want a life like family portrait; this style is drawn on a drawing tablet, which is connected, to a high power pc. This allows us to keep the quality high and as life like as can be. Also edits are a lot easier to be made in this style as it’s not a case of a complete redraw. This style takes 2 weeks to complete and like all our styles you will get an email preview.</p>
					<p class=""><strong>Colour Portrait Digital</strong></p>
					<p class="">This Colour Portrait digital style works perfectly from your photos. In fact this has been one of the best sellers last year. This style is created with a drawing tablet connected to a high power pc. This portrait is then carefully drawn to give an amazing result, like all our styles in takes approx. 2 weeks to be completed. Look out for our email preview, which will be in your inbox.</p>
					<p><strong>Colour Pencil Portrait</strong></p>
					<p class="">Colour Pencil Portrait is such an amazing style to choose, this is hand sketched and coloured in pencil to give you an outstanding finish. These take a day or two longer than the others due to the amount of work put in by our team.</p>
				</div>
			</div>
			<div class="row justify-content-end">
				<div class="op_content_3">
					<h2 class="op_heading">Order online</h2>
					<p>The best and easiest thing about Charlie’s Drawings is the ease of ordering. Our fully secure website can take card payments along with your required photos to make the process incredibly stress free. Any questions or problems we have a highly skilled team monitoring our emails and messages 24/7 so just get in touch with us.</p>
					<p><strong>How much will my portraits from photos cost?</strong></p>
					<p>So you’re probably thinking with the amount of work being put in and the customer service we offer than your portrait will cost the earth? No not at all, our prices start from just £15 per person. All black and white styles cost just £15 per person, whilst colour digital is just £16 per person; Colour pencil portrait is £20 per person.</p>
					<p><strong>What happens if I don’t like my Portrait?</strong></p>
					<p>The thing about art is that it is very subjective, especially when it’s a drawing of your loved ones, as lets face it you know them a lot better than us. So what we offer is step by step support until your happy with your drawing. With the amount of work that goes into each drawing plus the constant support we do have a no refund policy, as there is simply no need.</p>
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