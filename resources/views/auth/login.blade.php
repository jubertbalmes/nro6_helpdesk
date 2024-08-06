@extends('layouts.app', [
  'class' => 'off-canvas-sidebar',
  'classPage' => 'login-page',
  'activePage' => 'login',
  'title' => __('NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
  'pageBackground' => asset("material").'/img/header.jpg'
])

@section('content')
<div class="container">
    <div class="row">
      <div class="col-md-9 ml-auto mr-auto mb-1 text-center">
        <h3>{{ __('Welcome to  ICTS Helpdesk') }} </h3>

      </div>
      <div class="col-lg-5 col-md-8 col-sm-10 ml-auto mr-auto mb-3 text-center">
          <h5 class="text-lead text-white mt-2 mb-0">
              
          </h5>
          <ol class="text-lead text-light mt-3 mb-3">
              
          </ol>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-8 ml-auto mr-auto">
        <form class="form" method="POST" action="{{ route('login') }}">
          @csrf

          <div class="card card-login card-hidden">
            <div class="card-header card-header-info text-center">
              <h4 class="card-title">{{ __('Login') }}</h4>
              <!-- <div class="social-line">
                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                  <i class="fa fa-facebook-square"></i>
                </a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                  <i class="fa fa-twitter"></i>
                </a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                  <i class="fa fa-google-plus"></i>
                </a>
              </div> -->
            </div>
            <div class="card-body ">
              <span class="form-group  bmd-form-group email-error {{ $errors->has('email') ? ' has-danger' : '' }}" >
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">email</i>
                    </span>
                  </div>
                  <input type="email" class="form-control err-email" id="exampleEmails" name="email" placeholder="{{ __('Email...') }}" value="{{ old('email') }}" required>
                </div>
                @include('alerts.feedback', ['field' => 'email'])
              </span>
              <span class="form-group bmd-form-group{{ $errors->has('password') ? ' has-danger' : '' }}">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="material-icons">lock_outline</i>
                    </span>
                  </div>
                  <input type="password" class="form-control" id="examplePassword" name="password" placeholder="{{ __('Password...') }}" value="" required>
                </div>
                @include('alerts.feedback', ['field' => 'password'])
              </span>
              <div class="form-check mr-auto ml-3 mt-3">
                  <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> {{ __('Remember me') }}
                    <span class="form-check-sign">
                      <span class="check"></span>
                    </span>
                  </label>
                </div>
            </div>
            <div class="card-body padr10px">
              <div class="row ml-auto mr-auto">
                <button type="submit" class="btn btn-info btn-md btn-block">{{ __('LOGIN') }}</button>
              </div>
              <div class="row ml-auto mr-auto">
                <a href="{{ route('azure.login') }}" class="btn btn-success btn-md btn-block">{{ __('LOGIN WITH MICROSOFT  ') }}
                  <i class="fa fa-windows fa-2x clr-white"></i>
                </a>
              </div>
            </div>
          </div>
        </form>
        <div class="row">
          <div class="col-6">
              @if (Route::has('password.request'))
                  <a href="{{ route('password.request') }}" class="text-light">
                      <small>{{ __('Forgot password?') }}</small>
                  </a>
              @endif
          </div>
          <div class="col-6 text-right">
              <a href="{{ route('register') }}" class="text-light">
                  <small>{{ __('Create new account') }}</small>
              </a>
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
