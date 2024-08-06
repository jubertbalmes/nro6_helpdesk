@extends('layouts.app', [
  'class' => 'off-canvas-sidebar',
  'classPage' => 'register-page',
  'activePage' => 'register',
  'title' => __('NATIONAL ECONOMIC AND DEVELOPMENT AUTHORITY'),
  'pageBackground' => asset("material").'/img/header.jpg'
])

@section('content')
<div class="container">
  <div class="row">
    <div class="col-md-10 ml-auto mr-auto">
      <div class="card card-signup">
        <h2 class="card-title text-center">{{ __('Register') }}</h2>
        <div class="card-body">
          <div class="row">
            <div class="col-md-5 ml-auto mr-auto">
              <form class="form" method="POST" action="{{ route('register') }}">
                @csrf

                <div class="has-default{{ $errors->has('name') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">face</i>
                      </span>
                    </div>
                    <input type="text" name="name" class="form-control" placeholder="{{ __('Name...') }}" value="{{ old('name') }}" required/>
                  </div>
                  @if ($errors->has('name'))
                    <div id="name-error" class="error text-danger pl-3" for="name" style="display: block;">
                      <strong class="errors-field-name">{{ $errors->first('name') }}</strong>
                    </div>
                  @endif
                </div>
                <div class="has-default{{ $errors->has('email') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">mail</i>
                      </span>
                    </div>
                    <input type="text" class="form-control" name="email" placeholder="{{ __('Email...') }}" value="{{ old('email') }}" required/>
                  </div>
                  @if ($errors->has('email'))
                    <div id="email-error" class="row error text-danger pl-3" for="email" style="display: block;">
                      <strong class="errors-field-email">{{ $errors->first('email') }}</strong>
                    </div>
                  @endif
                </div>
                <div class="has-default{{ $errors->has('staff_id') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">groups</i>
                      </span>
                    </div>
                    <select class="selectpicker col-sm-10 pl-0 pr-0" data-live-search="true" style="display:inline-block" id="staff_id" name="staff_id" data-style="select-with-transition" title="Staff..." data-size="6">
                      @foreach ($staffs as $staff)
                        <option value="{{ $staff->id }}" @if (old('staff_id') == $staff->id) selected="selected" @endif>{{ $staff->abbreviation }}</option>
                      @endforeach
                    </select>
                  </div>
                  @if ($errors->has('staff_id'))
                    <div id="staff_id-error" class="error text-danger pl-3" for="staff_id" style="display: block;">
                      <strong class="errors-field-user">{{ $errors->first('staff_id') }}</strong>
                    </div>
                  @endif
                </div>
                <div class="has-default{{ $errors->has('position') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">work</i>
                      </span>
                    </div>
                    <select class="selectpicker col-sm-10 pl-0 pr-0" data-live-search="true" style="display:inline-block" name="position_id" data-style="select-with-transition" title="Position..." data-size="6">
                      @foreach ($positions as $position)
                        <option value="{{ $position->id }}" @if (old('position_id') == $position->id) selected="selected" @endif>{{ $position->name }}</option>
                      @endforeach
                    </select>
                  </div>
                  @if ($errors->has('position_id'))
                    <div id="position_id-error" class="error text-danger pl-3" for="position_id" style="display: block;">
                      <strong class="errors-field-user">{{ $errors->first('position_id') }}</strong>
                    </div>
                  @endif
                </div>

                {{-- <div class="has-default{{ $errors->has('contact_number') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">contact_phone</i>
                      </span>
                    </div>
                    <input type="text" name="contact_number" class="form-control" placeholder="{{ __('Cellphone Number...') }}" value="{{ old('contact_number', ) }}" required/>
                  </div>
                  @if ($errors->has('contact_number'))
                    <div id="contact_number-error" class="error text-danger pl-3" for="contact_number" style="display: block;">
                      <strong class="errors-field-contact_number">{{ $errors->first('contact_number') }}</strong>
                    </div>
                  @endif
                </div> --}}
                <div class="has-default{{ $errors->has('password') ? ' has-danger' : '' }} mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">lock_outline</i>
                      </span>
                    </div>
                    <input type="password" name="password" placeholder="{{ __('Password...') }}" class="form-control" value="" required>
                  </div>
                  @if ($errors->has('password'))
                    <div id="password-error" class="error text-danger pl-3" for="password" style="display: block;">
                      <strong class="errors-field-pass">{{ $errors->first('password') }}</strong>
                    </div>
                  @endif
                </div>
                <div class="has-default mb-3">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">lock_outline</i>
                      </span>
                    </div>
                    <input type="password" name="password_confirmation" id="password_confirmation" class="form-control" placeholder="{{ __('Confirm Password...') }}"  value="" required>
                  </div>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-info btn-round mt-4">{{ __('Submit') }}</button>
                </div>
              </form>
            </div>
          </div>
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
    });
  </script>
@endpush
