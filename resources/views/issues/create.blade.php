@extends('layouts.app', ['activePage' => 'report-issue', 'menuParent' => 'issues', 'titlePage' => __('Report Issue')])

@section('content')
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">

          <div id="CssLoader">
            <div class='spinftw'>
              <img src="{{ asset('material') }}/img/logowhite.png" height="30" width="30" style=""/>
            </div>
          </div>

          <form method="post" id="frmCreateTicket" enctype="multipart/form-data" action="{{ route('issue.store') }}" autocomplete="off" class="form-horizontal">
            @csrf
            @method('post')

            <div class="col-md-12">
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">assignment</i>
                      <h4 class="card-titleX">{{ __('Create New Ticket') }}</h4>
                    </div>
                  </div>
                </div>


                <div class="card-body" id="new-div">
                  <input value="1" type="text" name="status" hidden>
                  <input value="{{ auth()->user()->id }}" type="text" name="user_id" hidden>
                  <div class="row">
                    <div class="col-md-12 text-right">
                        <a href="{{ route('issue.index') }}" class="btn btn-sm btn-info">{{ __('Back to list') }}</a>
                    </div>
                  </div>

                  @can('update-reported_by', auth()->user())
                    <div class="row">
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Owner : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('user_id') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" data-live-search="true" data-show-subtext="true" name="user_id" data-style="select-with-transition" title=" " data-size="10">
                            @foreach ($users as $user)
                              @if(($user->isMember()) && ($user->status == 1 || $user->status == 2))
                                <option value="{{ $user->id }}" @if (old('user_id', auth()->user()->id) == $user->id) selected @endif @if($user->status == 2) data-subtext="<span style='color: gray;'>Inactive</span>" @elseif($user->status == 1)  data-subtext="<span style='color: green;'>Active</span>" @else data-subtext="<span class='text-info'>Pending</span>" @endif>{{ $user->name . ' (' . $user->email . ')'  }}</option>
                              @endif
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'user_id'])
                        </div>
                      </div>
                    </div>
                  @endcan

                  
                  <div class="row">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Category : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('main_category') ? ' has-danger' : '' }}">
                        <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" title=" " onchange="ocmaincategory()" data-live-search="true" id="main_category" name="main_category" data-style="select-with-transition" title="" data-size="8">
                          @foreach ($maincategories as $maincategory)
                            <option value="{{ $maincategory->id }}" @if (old('main_category') == $maincategory->id) selected="selected" @endif>{{ $maincategory->name }}</option>
                          @endforeach
                        </select>
                        @include('alerts.feedback', ['field' => 'main_category'])
                      </div>
                    </div>
                  </div>

                  <div class="row" id="divCategory" @if (old('main_category') == null || old('main_category') == '') hidden @endif>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Issue/Request : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('category_id') ? ' has-danger' : '' }}">
                        <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" title=" " onchange="occategory()" data-live-search="true" id="category_id" name="category_id" data-style="select-with-transition" title="" data-size="8">
                          @foreach ($categories as $category)
                            @if (old('main_category') == $category->main_id)
                              <option value="{{ $category->id }}" @if (old('category_id') == $category->id) selected="selected" @endif>{{ $category->name }}</option>
                            @endif
                          @endforeach
                        </select>
                        @include('alerts.feedback', ['field' => 'category_id'])
                      </div>
                    </div>
                  </div>

                  @if(auth()->user()->isMember() == false)
                    <div class="row">
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Priority : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('priority') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0" name="priority" data-style="select-with-transition" title=" " data-size="10">
                            <option value="1" @if (old('priority') == 1) selected="selected" @endif>Low</option>
                            <option value="2" @if (old('priority') == 2) selected="selected" @endif>Medium</option>
                            <option value="3" @if (old('priority') == 3) selected="selected" @endif>High</option>
                          </select>
                          @include('alerts.feedback', ['field' => 'priority'])
                        </div>
                      </div>
                    </div>
                  @endif

                  <div class="row">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Description : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('description') ? ' has-danger' : '' }}">
                        <textarea cols="30" rows="10" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" id="input-description" type="text" placeholder="{{ __(' ') }}">{{ old('description') }}</textarea>
                        @include('alerts.feedback', ['field' => 'description'])
                      </div>
                    </div>
                  </div>

                  <div class="row" hidden>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Steps to Replicate : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('steps_to_replicate') ? ' has-danger' : '' }}">
                        <textarea cols="30" rows="8" class="form-control{{ $errors->has('steps_to_replicate') ? ' is-invalid' : '' }}" name="steps_to_replicate" id="input-steps_to_replicate" type="text" placeholder="{{ __(' ') }}">{{ old('steps_to_replicate') }}</textarea>
                        @include('alerts.feedback', ['field' => 'steps_to_replicate'])
                      </div>
                    </div>
                  </div>

                  @can('update_resolver', auth()->user())
                    <br>
                    <div class="row">
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Man-days : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('work_days') ? ' has-danger' : '' }}">
                          <input class="form-control{{ $errors->has('work_days') ? ' is-invalid' : '' }}" name="work_days" id="input-work_days" type="number" placeholder="" min="1" max="31"/>
                          @include('alerts.feedback', ['field' => 'work_days'])
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Status : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('status') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0" title=" " id="status" name="status" data-style="select-with-transition" title="" data-size="10">
                            @foreach ($statuses as $status)
                              @if($status->id < 6)
                                <option value="{{ $status->id }}" @if (old('status', 1) == $status->id) selected="selected" @endif>{{ $status->status }}</option>
                              @endif
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'status'])
                        </div>
                      </div>
                    </div>

                    <div id="div_resolver_id" class="row" @if(old('status') < 2) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Assigned to : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('resolver_id') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" data-live-search="true" data-show-subtext="true" title=" " name="resolver_id" data-style="select-with-transition" title="" data-size="10">
                            @foreach ($users as $user)
                              @if($user->isCreator())
                                <option value="{{ $user->id }}" @if(old('resolver_id') == $user->id) selected @endif data-subtext="@if($user->status != 1) <span style='color: gray;'>Inactive</span> @else <span style='color: green;'>@if($user->id == $preffuser->id) Active & Preffered @else Active @endif</span> @endif">{{ $user->name . ' (' . $user->pendingTicket() . ')'  }}</option>
                              @endif
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'resolver_id'])
                        </div>
                      </div>
                    </div>

                    <div id="div_remarks" class="row" @if(old('status') != 4) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Resolution : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('remarks') ? ' has-danger' : '' }}">
                          <textarea cols="30" rows="8" class="form-control{{ $errors->has('remarks') ? ' is-invalid' : '' }}" name="remarks" id="input-remarks" type="text" placeholder="{{ __('Resolution') }}">{{ old('remarks') }}</textarea>
                          @include('alerts.feedback', ['field' => 'remarks'])
                        </div>
                      </div>
                    </div>
  
                    <div id="div_reason_for_rejection" class="row" @if(old('status') != 6) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Reason for Rejection : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('reason_for_rejection') ? ' has-danger' : '' }}">
                          <textarea cols="30" rows="8" class="form-control{{ $errors->has('reason_for_rejection') ? ' is-invalid' : '' }}" name="reason_for_rejection" id="input-reason_for_rejection" type="text" placeholder="{{ __('Reason') }}">{{ old('reason_for_rejection') }}</textarea>
                          @include('alerts.feedback', ['field' => 'reason_for_rejection'])
                        </div>
                      </div>
                    </div>

                    <div id="div_reason_for_reopen" class="row" @if(old('status') != 7) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Reason for Re-opening : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('reason_for_reopen') ? ' has-danger' : '' }}">
                          <textarea cols="30" rows="8" class="form-control{{ $errors->has('reason_for_reopen') ? ' is-invalid' : '' }}" name="reason_for_reopen" id="input-reason_for_reopen" type="text" placeholder="{{ __('Reason') }}">{{ old('reason_for_reopen') }}</textarea>
                          @include('alerts.feedback', ['field' => 'reason_for_reopen'])
                        </div>
                      </div>
                    </div>

                    <div id="div_remarks_creator" @if(old('status') != 5) hidden @endif>


                      <div class="row">
                        <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Ratings : ') }}</label>
                        <div class="col-sm-7">
                          <div class="form-group{{ $errors->has('rating') ? ' has-danger' : '' }}">
                            <select class="selectpicker col-sm-12 pl-0 pr-0" name="rating" data-style="select-with-transition" title=" " data-size="5">
                              @for ($x = 1; $x <= 5; $x++)
                                <option value="{{ $x }}" @if (old('rating') == $x) selected @endif>{{ $x }}</option>
                              @endfor
                            </select>
                            @include('alerts.feedback', ['field' => 'rating'])
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Owner\'s Remarks : ') }}</label>
                        <div class="col-sm-7">
                          <div class="form-group{{ $errors->has('remarks_creator') ? ' has-danger' : '' }}">
                            <textarea cols="30" rows="8" class="form-control{{ $errors->has('remarks_creator') ? ' is-invalid' : '' }}" name="remarks_creator" id="input-remarks_creator" type="text" placeholder="{{ __('Owner\'s Remarks') }}">{{ old('remarks_creator') }}</textarea>
                            @include('alerts.feedback', ['field' => 'remarks_creator'])
                          </div>
                        </div>
                      </div>
                    </div>

                  @endcan

                  <br>
                  <div class="row">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Attach File   ') }}
                      <span class="btn btn-info btn-link btn-sm vert-all" id="new-btn">
                        <span class="text-info">
                          <i class="material-icons fa-sm">add</i>
                        </span>
                      </span>:
                    </label>
                    <div class="col-sm-7">
                      <div class="fileinputs">
                        <div class="input-group">
                          <input id="2file_org" type="text" class="form-control" disabled/>
                            <span class="btn btn-info btn-file btn-link btn-sm vert-allx">
                              <i class="material-icons">attach_file</i>
                              <input id="file_org" type="file" name="attached_file[]" class="form-control"/>
                            </span>
                            <span class="btn btn-success btn-link btn-sm vert-allx" onClick="openFile('file_org')">
                              <i class="material-icons">download</i>
                            </span>
                            <span class="btn btn-danger btn-link btn-sm vert-allx" onClick="removeValforOrg()">
                              <i class="material-icons">close</i>
                            </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-footer ml-auto mr-auto">
                  <button id="btnContinue" type="button" class="btn btn-info" onclick="ocShowTSModal()">{{ __('Continue') }}</button>
                </div>
              </div>
            </div>



            <div class="modal fade mart-010" tabindex="-1" id="modalTS" role="dialog" aria-labelledby="modalTSTitle" aria-hidden="true" hidden>
              <div class="modal-dialog modal-md1" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title text-bold" id="modalTSTitle">Troubleshooting Steps</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <br>
                    <div class="row">
                      <div class="col-sm-12">
                        <div class="form-group">
                          <textarea cols="30" rows="10" class="form-control" id="input-ts" placeholder="{{ __('Troubleshooting Steps') }}" readonly></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer ml-auto mr-auto">
                    <button type="button" id="btnSubmit" class="btn btn-info" onclick="ocSubmitCreateTicket()">SUBMIT</button>
                  </div>
                  <br>
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
  var attachCtr = document.getElementById("new-div").children.length;
  var holidayDays = {!! json_encode($holidayDays) !!};
  var categories = {!! json_encode($categories) !!};
  @if(auth()->user()->isMember())
    var isMember = true;
  @else
    var isMember = false;
  @endif

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
    $('#issueforActionA').hide();
    $('#new-btn').on('click', function() {
      $('#new-div').append('<br><div class="row" id="div_att_' + attachCtr + '"><label class="col-sm-3 col-form-label col-form-labelX"></label><div class="col-sm-7"><div class="fileinputs"><div class="input-group"><input type="text" class="form-control" disabled><span class="btn btn-info btn-file btn-link btn-sm vert-allx"><i class="material-icons">attach_file</i><input type="file" name="attached_file[]" class="form-control" id="file_' + attachCtr + '"></span><span class="btn btn-success btn-link btn-sm vert-allx" onClick="openFile(\'file_' + attachCtr + '\')"><i class="material-icons">download</i></span><span class="btn btn-danger btn-link btn-sm vert-allx" onClick="removeDiv(\'div_att_' + attachCtr + '\')"><i class="material-icons">close</i></span></div></div></div></div>');
      $("#file_" + attachCtr).trigger("click");
      attachCtr++;
    });

    $(document).on('fileselect', '.btn-file :file', function(event, numFiles, label) {
      var input = $(this).closest('.input-group').find(':text'),
      log = numFiles > 1 ? numFiles + ' files selected' : label;
      if (input.length) {
        input.val(log);
      } else {
        if (log) alert(log);
      }
    });
    @if(auth()->user()->isMember()) 
      announcement();
    @endif
  });

  $(document).on('change', '.btn-file :file', function() {
    var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
  });

  function removeDiv(myDiv) {
    $('#' + myDiv).remove();
  }

  function openFile(myFile) {
    if ($('#' + myFile).val() != '') {
      var url = window.URL.createObjectURL(document.getElementById(myFile).files[0]);
      var a = $("<a style='display: none;'/>");
      a.attr("href", url);
      a.attr("download", document.getElementById(myFile).files[0].name);
      $("body").append(a);
      a[0].click();
      window.URL.revokeObjectURL(url);
      a.remove();
    } else {
      console.log('Wala laman');
    }
  }

  function removeValforOrg() {
    console.log('DUmaan');
    document.getElementById('file_org').value = null;
    document.getElementById('2file_org').value = null;
  }

  $('#status').on('change', function() {
    if ($('#status').val() >= 2) {
      document.getElementById('div_resolver_id').hidden = false;
    } else {
      if (document.getElementById('div_resolver_id')) {
        document.getElementById('div_resolver_id').hidden = true;
      }
    }

    if ($('#status').val() >= 4) {
      document.getElementById('div_remarks').hidden = false;
    } else {
      if (document.getElementById('div_remarks')) {
        document.getElementById('div_remarks').hidden = true;
      }
    }

    if ($('#status').val() >= 6) {
      document.getElementById('div_reason_for_rejection').hidden = false;
    } else {
      if (document.getElementById('div_reason_for_rejection')) {
        document.getElementById('div_reason_for_rejection').hidden = true;
      }
    }

    if ($('#status').val() == 7) {
      if (document.getElementById('div_reason_for_reopen')) {
        document.getElementById('div_reason_for_reopen').hidden = false;
      }
    } else {
      if (document.getElementById('div_reason_for_reopen')) {
        document.getElementById('div_reason_for_reopen').hidden = true;
      }
    }

    if ($('#status').val() == 5) {
      if (document.getElementById('div_remarks_creator')) {
        document.getElementById('div_remarks_creator').hidden = false;
      }
    } else {
      if (document.getElementById('div_remarks_creator')) {
        document.getElementById('div_remarks_creator').hidden = true;
      }
    }
  });

  function ocSubmitCreateTicket() {
    showCssLoader('btnSubmit');
    document.getElementById("frmCreateTicket").submit();
  }

  function ocShowTSModal() {
    if ($('#category_id').val() == '' || $('#category_id').val() == null || $('#category_id').val() == 'null') {
      showCssLoader('btnContinue');
      document.getElementById("frmCreateTicket").submit();
    } else {
      if (isMember == true) {
        let catIndex = categories.findIndex(item => item.id == $('#category_id').val());
        if (catIndex != -1) {
          if (categories[catIndex].ts == '' || categories[catIndex].ts == null || categories[catIndex].ts == 'null') {
            showCssLoader('btnContinue');
            document.getElementById("frmCreateTicket").submit();
          } else {
            $("#input-ts").val(categories[catIndex].ts);
            document.getElementById('modalTS').hidden = false;
            $("#modalTS").modal("show");
          }
        } else {
          showCssLoader('btnContinue');
          document.getElementById("frmCreateTicket").submit();
        }
      } else {
        showCssLoader('btnContinue');
        document.getElementById("frmCreateTicket").submit();
      }
    }
  }
</script>
@endpush