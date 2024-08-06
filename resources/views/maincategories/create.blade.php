@extends('layouts.app', ['activePage' => 'maincategory-management', 'menuParent' => 'laravel', 'titlePage' => __('Category Management')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-12">
          <form method="post" action="{{ route('maincategory.store') }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
            @csrf
            @method('post')
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">category</i>
                      <h4 class="card-titleX">{{ __('Add Category') }}</h4>
                    </div>
                  </div>
                </div>
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12 text-right">
                      <a href="{{ route('maincategory.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
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
                  <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Description :') }}</label>
                  <div class="col-sm-7">
                    <div class="form-group{{ $errors->has('description') ? ' has-danger' : '' }}">
                      <textarea cols="30" rows="2" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" id="input-description" type="text" placeholder="{{ __('Description') }}" required="true" aria-required="true">{{ old('description') }}</textarea>
                      @include('alerts.feedback', ['field' => 'description'])
                    </div>
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