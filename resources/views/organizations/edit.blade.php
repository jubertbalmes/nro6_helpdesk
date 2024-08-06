@extends('layouts.app', ['activePage' => 'organization-management', 'menuParent' => 'laravel', 'titlePage' => __('Organization Management')])

@section('content')
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <form method="post" action="{{ route('organization.update', $organization) }}" autocomplete="off" class="form-horizontal">
            @csrf
            @method('put')

            <div class="card ">
              <div class="card-header card-header-info card-header-icon">
                <div class="card-icon">
                  <i class="material-icons">recent_actors</i>
                </div>
                <h4 class="card-title">{{ __('Edit Positon') }}</h4>
              </div>
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('organization.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Organization Code') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('org_code') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('org_code') ? ' is-invalid' : '' }}" name="org_code" id="input-org_code" type="text"  value="{{ old('org_code', $organization->org_code) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'org_code'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Short Name') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('short_name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('short_name') ? ' is-invalid' : '' }}" name="short_name" id="input-short_name" type="text"  value="{{ old('short_name', $organization->short_name) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'short_name'])
                    </div>
                  </div>
                </div>
                <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Name') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('name') ? ' has-danger' : '' }}">
                      <input class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name" id="input-name" type="text"  value="{{ old('name', $organization->name) }}" required="true" aria-required="true"/>
                      @include('alerts.feedback', ['field' => 'name'])
                    </div>
                  </div>
                </div>
                <!-- <div class="row">
                  <label class="col-sm-2 col-form-label">{{ __('Description') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('description') ? ' has-danger' : '' }}">
                      <textarea cols="30" rows="10" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" id="input-description" type="text" placeholder="{{ __('Description') }}" required="true" aria-required="true">{{ old('description', $organization->description) }}</textarea>
                      @include('alerts.feedback', ['field' => 'description'])
                    </div>
                  </div>
                </div> -->
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