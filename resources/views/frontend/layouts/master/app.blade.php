<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
	<title>Mark drawings, Portraits from photos – markdrawing</title> 
    @include('frontend.layouts.inc.style')
    
</head>
<body>
    
    @include('frontend.layouts.inc.navbar')
    @include('frontend.layouts.inc.modal')
    

    
	@yield('content')
    
    @include('frontend.layouts.inc.footer')
	 
    @include('frontend.layouts.inc.script')
</body>
</html>