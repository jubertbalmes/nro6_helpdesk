@extends('layouts.app', ['activePage' => 'holiday-management', 'menuParent' => 'laravel', 'titlePage' => __('Holiday Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">          
          <form method="post" action="{{ route('holiday.update', $holiday) }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
            @csrf
            @method('put')
            <div class="card mb-8">
              <div class="card-header card-header-rose card-neda">
                <div class="card-body">
                  <div class="row">
                    <i class="material-icons">card_travel</i>
                    <h4 class="card-titleX">{{ __('Edit Holiday') }}</h4>
                  </div>
                </div>
              </div>
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('holiday.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Name :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{ old('name', $holiday->name) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Date :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('date') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('date') ? ' is-invalid' : '' }}" name="date" id="input-date" type="date" value="{{ old('date', $holiday->date) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'date'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Repeat every year :') }}</label>
                  <div class="col-sm-7 checkbox-radios mt-16" style="margin-top: 15px;">
                    <div class="form-check form-check-inline">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="repeat" value="1" @if(old('repeat', $holiday->repeat) == 1) checked @endif>Yes
                        <span class="circle">
                          <span class="check"></span>
                        </span>
                      </label>
                    </div>
                    <div class="form-check form-check-inline">
                      <label class="form-check-label">
                        <input class="form-check-input" type="radio" name="repeat" value="0" @if(old('repeat', $holiday->repeat) == 0) checked @endif>No
                        <span class="circle">
                          <span class="check"></span>
                        </span>
                      </label>
                    </div>
                    @include('alerts.feedback', ['field' => 'repeat'])
                  </div>
                </div>
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info btn-prevent-multiple-submit">{{ __('Save') }}</button>
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
      $('#pendingApprovalA').hide();
    });
  </script>
@endpush