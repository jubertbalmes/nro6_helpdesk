@extends('layouts.app', [
  'class' => 'off-canvas-sidebar',
  'classPage' => 'login-page',
  'activePage' => '',
  'title' => __('NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
  'pageBackground' => asset("material").'/img/header.jpg'
])

@section('content')
<div class="container">
  <div class="row justify-content-center">
      <div class="col-lg-7 col-md-8">
          <div class="card card-login card-hidden mb-3">
            <div class="card-header card-header-info text-center">
              <p class="card-title"><strong>{{ __('Pending Admin approval') }}</strong></p>
            </div>
            <div class="card-body">
              <p class="card-description text-center"></p>
              <p class="text-center">Your account is pending for approval, please contact system administrator.</p>
            </div>
          </div>
      </div>
  </div>
</div>
@endsection

@push('js')
<script>
  $(document).ready(function() {
    md.checkFullPageBackgroundImage();
    setTimeout(function() {
      // after 1000 ms we add the class animated to the login/register card
      $('.card').removeClass('card-hidden');
    }, 700);
  });
</script>
@endpush