@extends('layouts.app', ['activePage' => 'staff-management', 'menuParent' => 'laravel', 'titlePage' => __('Staff Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
          <form method="post" action="{{ route('staff.update', $staff) }}" autocomplete="off" class="form-horizontal">
            @csrf
            @method('put')
            <div class="card mb-8">
              <div class="card-header card-header-rose card-neda">
                <div class="card-body">
                  <div class="row">
                    <i class="material-icons">recent_actors</i>
                    <h4 class="card-titleX">{{ __('Edit Staff') }}</h4>
                  </div>
                </div>
              </div>
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('staff.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Name :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text" placeholder="{{ __('Name') }}" value="{{ old('name', $staff->name) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Abbreviation :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('abbreviation') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('abbreviation') ? ' is-invalid' : '' }}" name="abbreviation" id="input-abbreviation" type="text" placeholder="{{ __('Abbreviation') }}" value="{{ old('abbreviation', $staff->abbreviation) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'abbreviation'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('VoIP No. :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('voip') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('voip') ? ' is-invalid' : '' }}" name="voip" id="input-voip" type="text" placeholder="{{ __('VOIP Number') }}" value="{{ old('voip', $staff->voip) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'voip'])
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer ml-auto mr-auto">
                <button type="submit" class="btn btn-info">{{ __('Save') }}</button>
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