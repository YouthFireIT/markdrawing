@extends('frontend.layouts.master.app')
 
@section('content')

@if (Session::get('message'))
<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Success!</strong> {{Session::get('message')}}
</div>
@endif
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
						Contact
					</p>
				</div>
			</div>
		</div>
    </section>
    
	<!-- contact form -->
	<section class="contact-us py-5">
        <div class="container">
            <div class="contact-des">
                <h3>Need to get in touch?</h3>
                <p>Live Chat: ﻿The best way to get in touch is to launch the chat service on the website - ACTIVE ONLINE MOST OF THE DAY</p>
                <p>EMAIL - We now have one centralised email to contact us on </p>
                <p>orders@markdrawing.com </p>
                <p>Phone Support - </p>
                <div class="open-close">02071932003 -&nbsp;Weekdays 11am to 4pm&nbsp;</div>
            </div>
            <div class="contact-form">
              
              @if ($errors->any())
              <div class="alert alert-danger">
                  <ul>
                      @foreach ($errors->all() as $error)
                          <li>{{ $error }}</li>
                      @endforeach
                  </ul>
              </div>
            @endif
                <div class="row">
               
                        <div class="col-lg-6">
                            <form class="needs-validation" action="{{route('contact.save')}}" method="POST">

                              @csrf
                                <div class="form-row">
                                  <div class="col-md-12 mb-3">
                                    <label for="validationCustom01">Name</label>
                                    <input name="name" type="text" class="form-control" id="validationCustom01" required>
                                    <div class="valid-feedback">
                                      Looks good!
                                    </div>
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationCustom02">Email*</label>
                                    <input name="email" type="email" class="form-control" id="validationCustom02" required>
                                    <div class="valid-feedback">
                                      Looks good!
                                    </div>
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationCustom03">Phone Number</label>
                                    <input name="phone" type="tel" class="form-control" id="validationCustom03" required>
                                    <div class="valid-feedback">
                                      Looks good!
                                    </div>
                                  </div>
                                  <div class="col-md-12 mb-3">
                                    <label for="validationCustom04">Message</label>
                                    <textarea name="message" rows="10" class="form-control" id="validationCustom04"></textarea>
                                  </div>
                                </div>

                                <button class="btn btn-theme" type="submit">SEND</button>
                              </form>
                        </div>
                        <div class="col-lg-6">
                            <div class="map">
                                <iframe width="100%" height="488" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" id="gmap_canvas" src="https://maps.google.com/maps?width=560&amp;height=450&amp;hl=en&amp;q=%20dhaka%20sadar+()&amp;t=&amp;z=12&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe> <a href='https://www.symptoma.com/en/info/covid-19'>Symptoms Coronavirus</a> 
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
@endsection