@extends('layouts.app', ['activePage' => 'user-management', 'menuParent' => 'laravel', 'titlePage' => __('User Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
          <form method="post" enctype="multipart/form-data" action="{{ route('user.store') }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
            @csrf
            @method('post')
            
            {{-- <div class="card ">
              <div class="card-header card-header-info card-header-icon">
                <div class="card-icon">
                  <i class="material-icons">person</i>
                </div>
                <h4 class="card-title">{{ __('Add User') }}</h4>
              </div> --}}



              

            <div class="col-md-12">
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">person</i>
                      <h4 class="card-titleX">{{ __('Add User') }}</h4>
                    </div>
                  </div>
                </div>



              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('user.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                  </div>
                </div>
                <div class="row ml-auto mr-auto text-center">
                  <div class="col-sm-12">
                    <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                      <div class="fileinput-new thumbnail img-circle" style="width:100px; height:100px;overflow: hidden;">
                        <img src="{{ asset('material') }}/img/default-avatar.png" alt="..." style="max-width: 100px;">
                      </div>
                      <div class="fileinput-preview fileinput-exists thumbnail img-circle" style="max-width: 100px;"></div>
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
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{ old('name') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Email :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('email') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" id="input-email" type="email" placeholder="{{ __('Email') }}" value="{{ old('email') }}" required="true" aria-required="true" />
                      @include('alerts.feedback', ['field' => 'email'])
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Role :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('role_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" name="role_id" data-style="select-with-transition" title=" " data-size="8" required="true" aria-required="true">
                        @foreach ($roles as $role)
                          <option value="{{$role->id}}" @if (old('role_id') == $role->id) selected="selected" @endif>{{ $role->name }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'role_id'])
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Staff :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('staff_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" name="staff_id" data-live-search="true" data-style="select-with-transition" title=" " data-size="6" required="true" aria-required="true" >
                        @foreach ($staffs as $data)
                          <option value="{{$data->id}}" @if (old('staff_id') == $data->id) selected @endif>{{ $data->name . ' (' . $data->abbreviation . ')' }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'staff_id'])
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Position :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('position_id') ? ' has-danger' : '' }}">
                      <select class="selectpicker col-sm-12 pl-0 pr-0" name="position_id" data-live-search="true" data-style="select-with-transition" title=" " data-size="6" required="true" aria-required="true">
                        @foreach ($positions as $position)
                          <option value="{{$position->id}}" @if (old('position_id') == $position->id) selected @endif>{{ $position->name }}</option>
                        @endforeach
                      </select>
                      @include('alerts.feedback', ['field' => 'position_id'])
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('VoIP No. :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('voip') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('voip') ? ' is-invalid' : '' }}" name="voip" id="input-voip" type="text" placeholder="{{ __('VOIP Number') }}" value="{{ old('voip') }}"/>
                      @include('alerts.feedback', ['field' => 'voip'])
                    </div>
                  </div>
                </div>

                {{-- <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Cellphone No.') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('cell_number') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('cell_number') ? ' is-invalid' : '' }}" name="cell_number" id="input-cell_number" type="text" placeholder="{{ __('Cellphone Number') }}" value="{{ old('cell_number') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'cell_number'])
                    </div>
                  </div>
                </div>

                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Telephone No.') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('tel_number') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('tel_number') ? ' is-invalid' : '' }}" name="tel_number" id="input-tel_number" type="text" placeholder="{{ __('Telephone Number') }}" value="{{ old('tel_number') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'tel_number'])
                    </div>
                  </div>
                </div>


                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Alternate Email') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('alt_email') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('alt_email') ? ' is-invalid' : '' }}" name="alt_email" id="input-alt_email" type="text" placeholder="{{ __('Alternate Email') }}" value="{{ old('alt_email') }}" required="true" aria-required="true" />
                      @include('alerts.feedback', ['field' => 'alt_email'])
                    </div>
                  </div>
                </div> --}}

                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX" for="input-password">{{ __('Password :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('password') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" input type="password" name="password" id="input-password" placeholder="{{ __('Password') }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'password'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX" for="input-password-confirmation">{{ __('Confirm Password :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group">
                      <input class="form-control" name="password_confirmation" id="input-password-confirmation" type="password" placeholder="{{ __('Confirm Password') }}" required="true" aria-required="true"/>
                    </div>
                  </div>
                </div>
              </div>
              <input name="status" value=1 hidden>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info btn-prevent-multiple-submit">{{ __('Add User') }}</button>
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
  $(document).ready(function() {
    @if ($errors->has('error_message'))
      $.notify({
        icon: "close",
        message: "{{ $errors->first('error_message') }}"
      }, {
        type: 'danger',
        timer: 3000,
        placement: {
          from: 'top',
          align: 'right'
        }
      });
    @elseif ($errors->has('warning_message'))
      $.notify({
        icon: "close",
        message: "{{ $errors->first('warning_message') }}"
      }, {
        type: 'warning',
        timer: 3000,
        placement: {
          from: 'top',
          align: 'right'
        }
      });
    @elseif ($errors->any())
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
  });
</script>
@endpush