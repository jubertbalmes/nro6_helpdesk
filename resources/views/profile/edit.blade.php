@extends('layouts.app', ['activePage' => 'profile-management', 'menuParent' => 'profile', 'titlePage' => __('User Profile')])

@section('content')
<div class="content rempm">
  <div class="container-fluid">
    <div class="row">

      <div id="CssLoader">
        <div class='spinftw'></div>
      </div>


      <div class="col-md-12">
        <form method="post" enctype="multipart/form-data" action="{{ route('profile.update') }}" autocomplete="off" class="frm-prevent-multiple-submit">
          @csrf
          @method('put')
          <div class="col-md-12">
            <div class="card mb-8">
              <div class="card-header card-header-rose card-neda">
                <div class="card-body">
                  <div class="row">
                    <i class="material-icons">perm_identity</i>
                    <h4 class="card-titleX">{{ __('Edit Profile') }}</h4>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row ml-auto mr-auto text-center">
                  <div class="col-sm-12">
                    <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                      <div class="fileinput-new thumbnail img-circle" style="width:100px; height:100px;overflow: hidden;">
                        @if (auth()->user()->picture)
                          <img src="{{ auth()->user()->profilePicture() }}" alt="..." style="max-width: 100px;">
                        @else
                          <img src="{{ asset('material') }}/img/default-avatar.png" alt="..." style="max-width: 100px;">
                        @endif
                      </div>
                      <div class="fileinput-preview fileinput-exists thumbnail img-circle" style="width:100px; height:100px;overflow: hidden;"></div>
                      <div>
                        <span class="btn btn-info btn-file btn-link txtinit">
                          <span class="fileinput-new">
                            <i class="material-icons">edit</i> Edit
                          </span>
                          <span class="fileinput-exists">
                            <i class="fa fa-refresh"></i> Change
                          </span>
                          <input type="file" name="photo" id = "input-picture" />
                        </span>
                        <a href="#pablo" class="btn btn-danger btn-link fileinput-exists txtinit" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                      </div>
                      @include('alerts.feedback', ['field' => 'photo'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Name :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{ old('name', auth()->user()->name) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Email :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('email') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" id="input-email" type="email" placeholder="{{ __('Email') }}" value="{{ old('email', auth()->user()->email) }}" required="true" @cannot('update-email') readonly @endcannot/>
                      @include('alerts.feedback', ['field' => 'email'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Position') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('position_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" name="position_id" data-live-search="true" data-style="select-with-transition" title=" " data-size="6" required="true" aria-required="true">
                        @foreach ($positions as $position)
                          <option value="{{ $position->id }}" @if (old('position_id', auth()->user()->position_id) == $position->id) selected @endif>{{ $position->name }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'position_id'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Staff') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('staff_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" data-live-search="true" style="display:inline-block" name="staff_id" data-style="select-with-transition" title=" " data-size="6">
                        @foreach ($staffs as $staff)
                          <option value="{{ $staff->id }}" @if (old('staff_id', auth()->user()->staff_id) == $staff->id) selected @endif>{{ $staff->name . ' (' . $staff->abbreviation . ')' }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'staff_id'])
                    </div>
                  </div>
                </div>
  
                <div class="row">
                  <label class="col-sm-3   col-form-label col-form-labelX">{{ __('VoIP No.') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('voip') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('voip') ? ' is-invalid' : '' }}" name="voip" id="input-voip" type="text" placeholder="{{ __('VOIP Number') }}" value="{{ old('voip', auth()->user()->voip) }}"/>
                      @include('alerts.feedback', ['field' => 'voip'])
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info pull-right btn-prevent-multiple-submit">{{ __('Update Profile') }}</button>
              </div>
            </div>
          </div>
        </form>


        <form method="post" action="{{ route('profile.password') }}" class="form-horizontal frm-prevent-multiple-submit">
          @csrf
          @method('put')
          <br>
          <div class="col-md-12">
            <div class="card mb-8">
              <div class="card-header card-header-rose card-neda">
                <div class="card-body">
                  <div class="row">
                    <i class="material-icons">lock</i>
                    <h4 class="card-titleX">{{ __('Change password') }}</h4>
                  </div>
                </div>
              </div>
              
              <div class="card-body">
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX" for="input-current-password">{{ __('Current Password :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('old_password') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('old_password') ? ' is-invalid' : '' }}" input type="password" name="old_password" id="input-current-password" placeholder="{{ __('Current Password') }}" value="" required />
                      @include('alerts.feedback', ['field' => 'old_password'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX" for="input-password">{{ __('New Password :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('password') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" id="input-password" type="password" placeholder="{{ __('New Password') }}" value="" required />
                      @include('alerts.feedback', ['field' => 'password'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX" for="input-password-confirmation">{{ __('Confirm New Password :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group">
                      <input class="form-control" name="password_confirmation" id="input-password-confirmation" type="password" placeholder="{{ __('Confirm New Password') }}" value="" required />
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info pull-right btn-prevent-multiple-submit">{{ __('Change password') }}</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
@endsection

@push('js')
<script>
  $(document).ready(function () {
    @if ($errors->has('not_allow_profile'))
      $.notify({
        icon: "close",
        message: "{{ $errors->first('not_allow_profile') }}"
      }, {
        type: 'danger',
        timer: 3000,
        placement: {
          from: 'top',
          align: 'right'
        }
      });

    @else
      @if ($errors->first() == '' || $errors->first() == null)
      @else
        $.notify({
          icon: "close",
          message: "{{ $errors->first() }}"
        }, {
          type: 'danger',
          timer: 3000,
          placement: {
            from: 'top',
            align: 'right'
          }
        });
      @endif
    @endif
  });
</script>
@endpush