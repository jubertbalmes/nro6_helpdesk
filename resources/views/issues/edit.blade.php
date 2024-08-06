@extends('layouts.app', ['activePage' => 'view-request', 'menuParent' => 'issues', 'titlePage' => __('View Issue')])

@section('content')
<head>
<meta name="csrf-token" content="{{ csrf_token() }}">
</head>
  <div class="content rempm">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">

          <div id="CssLoader">
            <div class='spinftw'>
              <img src="{{ asset('material') }}/img/logowhite.png" height="30" width="30" style=""/>
            </div>
          </div>

          @can('reOpenComplete', $issue)
            <form method="post" action="{{ route('setToComplete', $issue) }}" enctype="multipart/form-data" autocomplete="off" class="form-horizontal" id="formsetToComplete">
              @csrf
              @method('post')
              <div class="modal hide mart-010" tabindex="-1" id="modalsetToComplete" role="dialog" aria-labelledby="modalsetToCompleteTitle" aria-hidden="true" hidden>
                <div class="modal-dialog modal-md" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="modalsetToCompleteTitle">
                        <span id="ratingDesc" class="text-bold" style="color: green;">Very satisfied</span>
                      </h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="ratings ml-auto mr-auto">
                          <i id="star1" class="fa fa-star rating-color" onclick="chColor(1)"></i>
                          <i id="star2" class="fa fa-star rating-color" onclick="chColor(2)"></i>
                          <i id="star3" class="fa fa-star rating-color" onclick="chColor(3)"></i>
                          <i id="star4" class="fa fa-star rating-color" onclick="chColor(4)"></i>
                          <i id="star5" class="fa fa-star rating-color" onclick="chColor(5)"></i>
                          <input id="rating" name="rating" value="5" hidden>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-10 ml-auto mr-auto">
                          <div class="form-group{{ $errors->has('remarks_creator') ? ' has-danger' : '' }}">
                            <textarea cols="30" rows="8" class="form-control{{ $errors->has('remarks_creator') ? ' is-invalid' : '' }}" name="remarks_creator" id="remarks_creator" type="text" placeholder="{{ __('Comments...') }}">{{ old('remarks_creator', $issue->remarks_creator) }}</textarea>
                            @include('alerts.feedback', ['field' => 'remarks_creator'])
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer ml-auto mr-auto">
                      <button id="btnSubmitRating" type="button" class="btn btn-primary" onclick="ocSubmitRating()">SUBMIT</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
            <form method="post" action="{{ route('setToReopen', $issue) }}" enctype="multipart/form-data" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
              @csrf
              @method('post')
              <div class="modal hide mart-010" tabindex="-1" id="modalsetToReopen" role="dialog" aria-labelledby="modalsetToReopenTitle" aria-hidden="true" hidden>
                <div class="modal-dialog modal-md" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="modalsetToReopenTitle">Reason for Re-Opening</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="row">
                        <div class="col-sm-12">
                          <div class="form-group{{ $errors->has('reason_for_reopen') ? ' has-danger' : '' }}">
                            <textarea cols="30" rows="8" class="form-control{{ $errors->has('reason_for_reopen') ? ' is-invalid' : '' }}" name="reason_for_reopen" type="text" placeholder="{{ __('Reason') }}" required="true">{{ old('reason_for_reopen', $issue->reason_for_reopen) }}</textarea>
                            @include('alerts.feedback', ['field' => 'reason_for_reopen'])
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-prevent-multiple-submit">SUBMIT</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
          @endcan

          <form method="post" enctype="multipart/form-data" action="{{ route('issue.update', $issue) }}" autocomplete="off" class="form-horizontal frm-prevent-multiple-submit">
            @csrf
            @method('put')
            <div class="col-md-12">
              <div class="card mb-8">
                <div class="card-header card-header-rose card-neda">
                  <div class="card-body">
                    <div class="row">
                      <i class="material-icons">assignment</i>
                      @if(auth()->user()->isMember())
                        <h4 class="card-titleX">{{ 'Ticket # ' . $issue->reff_no . ' : ' . $issue->mstatus->status }}</h4>
                      @else
                        <h4 class="card-titleX">{{ 'Ticket # ' . $issue->reff_no }}</h4>
                      @endif
                    </div>
                  </div>
                  @if(($issue->resolver_id != null && auth()->user()->isCreator() && auth()->user()->id == $issue->resolver->id) || (auth()->user()->isAdmin() || auth()->user()->isHOD()))
                    <p class="card-category"> Reported By: {{ $issue->user->name . ' (' . $issue->user->email . ')' }}
                      <a role="button" data-toggle="popover" data-trigger="hover" data-animation="false" data-html="true" data-content="<span class='text-info txtbold'>Staff&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </span>{{ $issue->user->mstaff->abbreviation }}<br><span class='text-info txtbold'>VoIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </span>{{ $issue->user->voip_no() }}">
                        <span class="text-info"><i class="fa fa-info-circle"></i></span>
                      </a>  
                    </p>
                  @elseif($issue->status > 1 && $issue->resolver_id != null)
                    <p class="card-category"> Assigned To: {{ $issue->resolver->name . ' (' . $issue->resolver->email . ') - ' }}<span style="color: @if($issue->resolver->status == 1) #6fe898 @else #d48f72 @endif;">{{  $issue->resolver->status_desc() }}</span>
                      <a role="button" data-toggle="popover" data-trigger="hover" data-animation="false" data-html="true" data-content="<span class='text-info txtbold'>VoIP&nbsp;&nbsp;: </span>{{ $issue->resolver->voip_no() }}">
                        <span class="text-info"><i class="fa fa-info-circle"></i></span>
                      </a> 
                    </p>
                  @endif
                </div>

                <div class="card-body" id="new-div">
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
                          <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" data-show-subtext="true" data-live-search="true" name="user_id" data-style="select-with-transition" title=" " data-size="100">
                            @foreach ($users as $user)
                              @if(($user->isMember()) && ($user->status == 1 || $user->status == 2))
                              {{-- @if(auth()->user()->isHOD() && $user->isMember())
                                <option value="{{ $user->id }}" @if (old('user_id', $issue->user_id) == $user->id) selected="selected" @endif>{{ $user->name . ' (' . $user->email . ')'  }}</option>
                              @elseif(auth()->user()->isAdmin())
                                <option value="{{ $user->id }}" @if (old('user_id', $issue->user_id) == $user->id) selected="selected" @endif>{{ $user->name . ' (' . $user->email . ')'  }}</option>
                              @elseif($user->id == $issue->user_id) --}}
                                <option value="{{ $user->id }}" @if (old('user_id', $issue->user_id) == $user->id) selected="selected" @endif data-subtext="@if($user->status == 2) <span style='color: gray;'>Inactive</span> @elseif($user->status == 1) <span style='color: green;'>Active</span> @else <span class='text-info'>Pending</span> @endif">{{ $user->name . ' (' . $user->email . ')'  }}</option>
                              @endif
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'user_id'])
                        </div>
                      </div>
                    </div>
                  @else
                    <input value="{{ $issue->user_id }}" type="text" name="user_id" hidden>
                  @endcan

                  
                  <div class="row">
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Category : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('main_category') ? ' has-danger' : '' }}">
                        <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" title=" " onchange="ocmaincategory()" data-live-search="true" id="main_category" name="main_category" data-style="select-with-transition" title="" data-size="8">
                          @foreach ($maincategories as $maincategory)
                            <option value="{{ $maincategory->id }}" @if (old('main_category', $issue->category->maincategory->id) == $maincategory->id) selected="selected" @endif>{{ $maincategory->name }}</option>
                          @endforeach
                        </select>
                        @include('alerts.feedback', ['field' => 'main_category'])
                      </div>
                    </div>
                  </div>

                  <div class="row" id="divCategory" @if (old('main_category', $issue->category->maincategory->id) == null || old('main_category', $issue->category->maincategory->id) == '') hidden @endif>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Issue/Request : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('category_id') ? ' has-danger' : '' }}">
                        <select class="selectpicker col-sm-12 pl-0 pr-0" data-live-search="true" id="category_id" name="category_id" data-style="select-with-transition" title="" data-size="8">
                          @foreach ($categories as $category)
                            @if (old('main_category', $issue->category->maincategory->id) == $category->main_id)
                              <option value="{{ $category->id }}" @if (old('category_id', $issue->category_id) == $category->id) selected="selected" @endif>{{ $category->name }}</option>
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
                          <select class="selectpicker col-sm-12 pl-0 pr-0" name="priority" data-style="select-with-transition" title="" data-size="100">
                            <option value="1" @if (old('priority', $issue->priority) == 1) selected="selected" @endif>Low</option>
                            <option value="2" @if (old('priority', $issue->priority) == 2) selected="selected" @endif>Medium</option>
                            <option value="3" @if (old('priority', $issue->priority) == 3) selected="selected" @endif>High</option>
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
                        <textarea cols="30" rows="10" class="form-control{{ $errors->has('description') ? ' is-invalid' : '' }}" name="description" id="input-description" type="text" placeholder="{{ __('Description') }}" required="true" aria-required="true">{{ old('description', $issue->description) }}</textarea>
                        @include('alerts.feedback', ['field' => 'description'])
                      </div>
                    </div>
                  </div>

                  <div class="row" hidden>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Steps to Replicate : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('steps_to_replicate') ? ' has-danger' : '' }}">
                        <textarea cols="30" rows="8" class="form-control{{ $errors->has('steps_to_replicate') ? ' is-invalid' : '' }}" name="steps_to_replicate" id="input-steps_to_replicate" type="text" placeholder="{{ __('Steps to Replicate') }}">{{ old('steps_to_replicate', $issue->steps_to_replicate) }}</textarea>
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
                          <input class="form-control{{ $errors->has('work_days') ? ' is-invalid' : '' }}" name="work_days" id="input-work_days" type="number" placeholder="" min="1" max="31" value="{{ old('work_days', $issue->work_days == null ? $issue->category->man_day : $issue->work_days) }}"/>
                          @include('alerts.feedback', ['field' => 'work_days'])
                        </div>
                      </div>
                    </div>
                  @endcan

                  @can('edit_status', $issue)
                    <div class="row">
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Status : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('status') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0" id="status" name="status" data-style="select-with-transition" title=" " data-size="10">
                            @foreach ($statuses as $status)
                              @if(auth()->user()->isCreator())
                                @if(in_array($status->id, array(2, 3, 4, 7)))
                                  <option value="{{ $status->id }}" @if (old('status', $issue->status) == $status->id) selected="selected" @endif @if($status->id == 2 || $status->id == 7) disabled @endif>{{ $status->status }}</option>
                                @endif
                              @else
                                <option value="{{ $status->id }}" @if (old('status', $issue->status) == $status->id) selected="selected" @endif>{{ $status->status }}</option>
                              @endif
                              {{-- <option value="{{ $status->id }}" @if (old('status', $issue->status) == $status->id) selected="selected" @endif  @if(auth()->user()->isCreator() &&! in_array($status->id, array(3, 4))) disabled @endif>{{ $status->status }}</option> --}}
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'status'])
                        </div>
                      </div>
                    </div>
                  @else
                    @if(auth()->user()->isCreator() && $issue->status == 5)
                      <div class="row">
                        <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Status : ') }}</label>
                        <div class="col-sm-7">
                          <div class="form-group{{ $errors->has('steps_to_replicate') ? ' has-danger' : '' }}">
                            <input class="form-control" type="text" value="Completed"/>
                          </div>
                        </div>
                      </div>
                    @endif
                    <input value="{{ $issue->status }}" type="text" name="status" hidden>
                  @endcan

                  @can('update_resolver', auth()->user())
                    <div id="div_resolver_id" class="row" @if(old('status', $issue->status) < 2) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Assigned to : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('resolver_id') ? ' has-danger' : '' }}">
                          <select class="selectpicker col-sm-12 pl-0 pr-0 show-tick" data-live-search="true" data-show-subtext="true" name="resolver_id" data-style="select-with-transition" title=" " data-size="10">
                            @foreach ($users as $user)
                              @if($user->isCreator())
                                <option value="{{ $user->id }}" @if (old('resolver_id', $issue->resolver_id) == $user->id) selected @endif data-subtext="@if($user->status != 1) <span style='color: gray;'>Inactive</span> @else <span style='color: green;'>@if($user->id == $preffuser->id) Active & Preffered @else Active @endif</span> @endif">{{ $user->name . ' (' . $user->pendingTicket() . ')'  }}</option>
                              @endif
                            @endforeach
                          </select>
                          @include('alerts.feedback', ['field' => 'resolver_id'])
                        </div>
                      </div>
                    </div>
                  @else
                    <div id="div_resolver_name" class="row" @if(old('status', $issue->status) < 2) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Assigned to : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group">
                          <input type="text" class="form-control" @if(old('resolver_id', $issue->resolver_id) != null) value="{{ $issue->resolver->name }}" @endif/>
                          <input name="resolver_id" value="{{ old('resolver_id', $issue->resolver_id) }}" hidden>
                          @include('alerts.feedback', ['field' => 'resolver_id'])
                        </div>
                      </div>
                    </div>
                  @endcan

                  <div id="div_remarks" class="row" @if(old('status', $issue->status) == 4 || old('status', $issue->status) == 5) @else hidden @endif>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Resolution : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('remarks') ? ' has-danger' : '' }}">
                        <textarea cols="30" rows="8" class="form-control{{ $errors->has('remarks') ? ' is-invalid' : '' }}" name="remarks" id="input-remarks" type="text" placeholder="{{ __('Remarks') }}">{{ old('remarks', $issue->remarks) }}</textarea>
                        @include('alerts.feedback', ['field' => 'remarks'])
                      </div>
                    </div>
                  </div>

                  <div id="div_reason_for_rejection" class="row" @if(old('status', $issue->status) != 6) hidden @endif>
                    <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Reason for Rejection : ') }}</label>
                    <div class="col-sm-7">
                      <div class="form-group{{ $errors->has('reason_for_rejection') ? ' has-danger' : '' }}">
                        <textarea cols="30" rows="8" class="form-control{{ $errors->has('reason_for_rejection') ? ' is-invalid' : '' }}" name="reason_for_rejection" id="input-reason_for_rejection" type="text" placeholder="{{ __('Reason') }}">{{ old('reason_for_rejection', $issue->reason_for_rejection) }}</textarea>
                        @include('alerts.feedback', ['field' => 'reason_for_rejection'])
                      </div>
                    </div>
                  </div>

                  {{-- @can('update-reported_by', auth()->user()) --}}
                    <div id="div_reason_for_reopen" class="row" @if(old('status', $issue->status) != 7) hidden @endif>
                      <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Reason for Re-opening : ') }}</label>
                      <div class="col-sm-7">
                        <div class="form-group{{ $errors->has('reason_for_reopen') ? ' has-danger' : '' }}">
                          <textarea cols="30" rows="8" class="form-control{{ $errors->has('reason_for_reopen') ? ' is-invalid' : '' }}" name="reason_for_reopen" id="input-reason_for_reopen" type="text" placeholder="{{ __('Reason') }}">{{ old('reason_for_reopen', $issue->reason_for_reopen) }}</textarea>
                          @include('alerts.feedback', ['field' => 'reason_for_reopen'])
                        </div>
                      </div>
                    </div>
                  {{-- @endcan --}}

                  {{-- @can('update-reported_by', auth()->user()) --}}
                    <div id="div_remarks_creator" @if(old('status', $issue->status) != 5) hidden @endif>
                      <div class="row">
                        <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Rating : ') }}</label>
                        <div class="col-sm-7">
                          <div class="form-group{{ $errors->has('rating') ? ' has-danger' : '' }}">
                            <select class="selectpicker col-sm-12 pl-0 pr-0" name="rating" data-style="select-with-transition" title=" " data-size="5">
                              @for ($x = 1; $x <= 5; $x++)
                                <option value="{{ $x }}" @if (old('rating', $issue->rating) == $x) selected @endif>
                                  {{ $x == 5 ? 'Outstanding' : ($x == 4 ? 'Very satified' : ($x == 3 ? 'Satisfied' : ($x == 2 ? 'Disatisfied' : 'Very Disatisfied')))}}

                                </option>
                              @endfor
                            </select>
                            @include('alerts.feedback', ['field' => 'rating'])
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <label class="col-sm-3 col-form-label col-form-labelX">{{ __('Creators Remarks : ') }}</label>
                        <div class="col-sm-7">
                          <div class="form-group{{ $errors->has('remarks_creator') ? ' has-danger' : '' }}">
                            <textarea cols="30" rows="8" class="form-control{{ $errors->has('remarks_creator') ? ' is-invalid' : '' }}" name="remarks_creator" id="input-remarks_creator" type="text" placeholder="{{ __('Remarks') }}">{{ old('remarks_creator', $issue->remarks_creator) }}</textarea>
                            @include('alerts.feedback', ['field' => 'remarks_creator'])
                          </div>
                        </div>
                      </div>
                    </div>
                  {{-- @endcan --}}

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
                          <input id="2file_org" type="text" class="form-control" @if(count($attachments)>0) value="{{ $attachments[0]->orig_file }}" @endif disabled>
                          {{-- <span class="input-group-btn ml-auto"> --}}
                            <span class="btn btn-info btn-file btn-link btn-sm vert-allx">
                              <i class="material-icons">attach_file</i>
                              <input type="file" name="attached_file[]" class="form-control" id="file_org" onChange="updateOCEvent('org')">
                            </span>
                            <a id="download_org" @if(count($attachments)>0) href="{{ url('issue/download_attachment', $attachments[0]->id) }}" onClick="" @else href="#" @endif>
                              <span class="btn btn-success btn-link btn-sm vert-allx">
                                <i class="material-icons">download</i>
                              </span>
                            </a>
                            <span class="btn btn-danger btn-link btn-sm vert-allx" onClick="removeValforOrg()">
                              <i class="material-icons">close</i>
                            </span>
                          {{-- </span> --}}
                        </div>
                      </div>
                    </div>
                    <input id="id_org" name="att_id[]" type="text" @if (count($attachments) > 0) value="{{ $attachments[0]->id }}" @endif hidden> 
                  </div>

                  
                  @for($i = 1; $i < count($attachments); $i++)
                    <br>
                    <div class="row" id="div_att_old_{{ $attachments[$i]->id }}">
                      <label class="col-sm-2 col-form-label"></label>
                      <div class="col-sm-7">
                        <div class="fileinputs">
                          <div class="input-group">
                            <input type="text" class="form-control" disabled value="{{ $attachments[$i]->orig_file }}"/>
                            {{-- <span class="input-group-btn"> --}}
                              <span class="btn btn-info btn-file btn-link btn-sm vert-allx">
                                <i class="material-icons">attach_file</i>
                                <input type="file" name="attached_file[]" class="form-control" id="file_org{{ $attachments[$i]->id }}" onChange="updateOCEvent('org{{ $attachments[$i]->id }}')">
                              </span>
                              <a id="download_org{{ $attachments[$i]->id }}" href="{{ url('issue/download_attachment', $attachments[$i]->id) }}" onClick="">
                                <span class="btn btn-success btn-link btn-sm vert-allx">
                                  <i class="material-icons">download</i>
                                </span>
                              </a>
                              <span class="btn btn-danger btn-link btn-sm vert-allx" onClick="removeDiv('div_att_old_{{ $attachments[$i]->id }}')">
                                <i class="material-icons">close</i>
                              </span>
                            {{-- </span> --}}
                          </div>
                        </div>
                      </div>
                      <input id="id_org{{ $attachments[$i]->id }}" name="att_id[]" type="text" value="{{ $attachments[$i]->id }}" hidden>
                    </div>
                  @endfor
                </div>
                <div class="card-footer ml-auto mr-auto">
                  @can('update', $issue)
                    <button type="submit" class="btn btn-info btn-prevent-multiple-submit">{{ __('Save') }}</button>
                  @endcan
                  @can('reOpenComplete', $issue)
                    <button type="button" class="btn btn-success" onclick="showToComplete()">{{ __('Complete') }}</button>
                    <button type="button" class="btn btn-warning" onclick="showToReopen()">{{ __('Re-Open') }}</button>
                  @endcan
                </div>
                
                @can('viewMessage', $issue)
                  <div class="fixed-plugin message75">
                    <a href="#/" data-toggle="tooltip" title="@if($messageuser == 1) You have new message @else Communications @endif" onClick="showChat()"><i id="btnChat" class="fa fa-comments-o fa-2x clr-white" @if($messageuser == 1) style="color: red !important;" @endif></i>
                      {{-- <span class="badge badge-pill badge-danger">1</span> --}}
                    </a>
                  </div>

                  <div class="modal fade" style="margin-top: -9.0rem !important;" tabindex="-1" id="modalChat" role="dialog" aria-labelledby="modalChatTitle" aria-hidden="true" hidden>
                    <div class="modal-dialog modal-dialog-centered modal-md2" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title col-form-labelX text-bold" id="modalChatTitle">Communications: {{ $issue->reff_no }}</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body mdv2" id="divInbox">
                          <?php
                            $curr_date = null;
                            $today_date = date('Y-m-d');
                            $today_sw = 0;
                          ?>
                          @foreach($messages as $message)
                            @if($today_date != $message->created_at->format('Y-m-d'))
                              @if($curr_date != $message->created_at->format('Y-m-d'))
                                <div class="row text-center ml-auto mr-auto">
                                  <div class="col-sm-12" style="padding-top: 15px; padding-bottom: 15px;">
                                    {{ $message->created_at->format('F d Y') }}
                                  </div>
                                </div>
                                <?php
                                  $curr_date = $message->created_at->format('Y-m-d');
                                ?>
                              @endif
                            @else
                              @if($today_sw == 0)
                                <div class="row text-center ml-auto mr-auto">
                                  <div class="col-sm-12" style="padding-top: 15px; padding-bottom: 15px;">
                                    Today
                                  </div>
                                </div>
                                <?php
                                  $today_sw = 1;
                                ?>
                              @endif
                            @endif

                            @if($message->user->id == auth()->user()->id)
                              <div class="row">
                                <div class="col-sm-6 ml-auto pad20msg">
                                  <div class="card-header card-header-info">
                                    <p class="card-category">{{ $message->message }}</p>
                                  </div>
                                  <div class="card-footer">
                                    <div class="stats">
                                      {{ 'From: Me, ' . $message->created_at->format('g:i:s A') }}
                                    </div>
                                  </div>
                                </div>
                              </div>
                            @else
                              <div class="row">
                                <div class="col-sm-6 mr-auto pad20msg">
                                  <div class="card-header @if(($message->user->role_id == 2 && (auth()->user()->role_id == 1 || auth()->user()->role_id == 4)) || (($message->user->role_id == 1 || $message->user->role_id == 4) && (auth()->user()->role_id == 2 || auth()->user()->role_id == 3))) card-header-warning @else card-header-success @endif">
                                    <p class="card-category">{{ $message->message }}</p>
                                  </div>
                                  <div class="card-footer">
                                    <div class="stats">
                                      {{ 'From: ' . $message->user->name . ', ' . $message->created_at->format('g:i:s A') }}
                                    </div>
                                  </div>
                                </div>
                              </div>
                            @endif
                          @endforeach
                        </div>


                        <div class="col-lg-12 text-center ml-auto mr-auto">
                          <div class="card">
                            <div class="card-body">
                              <div class="row text-center ml-auto mr-auto">
                                <div class="col-sm-9">
                                  <div class="form-group">
                                    <textarea rows="2" class="form-control" id="inputMessage" type="text" placeholder="{{ __('Type your message here...') }}" @cannot('sendMessage', $issue) readonly @endcannot></textarea>
                                  </div>
                                </div>
                                <div class="col-sm-3" style="display : flex; align-items : center; justify-content: center;">
                                  <button type="button" id="btnSend" class="btn btn-primary btn-lg @cannot('sendMessage', $issue) disabled @endcannot" onclick="ocBtnSend()">
                                    Send&nbsp;<i class="material-icons vert-m">send</i>
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                @endcan

                @can('viewLogs', $issue)
                  <div class="fixed-plugin logs50">
                    <a href="#/" data-toggle="tooltip" title="Logs" onClick="showLogs()"><i class="fa fa-file-text-o fa-2x clr-white"></i></a>
                  </div>

                  <div class="modal fade mart-010" tabindex="-1" id="modalLogs" role="dialog" aria-labelledby="modalLogsTitle" aria-hidden="true" hidden>
                    <div class="modal-dialog modal-md" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="modalLogsTitle">Issue Logs</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <div class="table-responsive">
                            <table class="table">
                              <thead class=" text-primary">
                                <th>
                                  Date
                                </th>
                                <th>
                                  Name
                                </th>
                                <th>
                                  Status
                                </th>
                                <th>
                                  Remarks
                                </th>
                              </thead>
                              <tbody>
                                @foreach($projectlogs as $log)
                                  <tr>
                                    <td>{{ $log->created_at->format('Y-m-d h:i:s A') }}</td>
                                    <td>
                                      @if($log->user_id == 0 || $log->user_id == null)
                                        {{ '(System)' }}
                                      @else
                                        {{ $log->user->name . ' (' . $log->user->role->name . ')' }}
                                      @endif
                                    </td>
                                    @if($log->status == 0)
                                      <td>{{ '(Changed Technician)' }}</td>
                                    @else
                                      <td>{{ $log->mstatus->status }}</td>
                                    @endif
                                    <td>{{ $log->remarks }}</td>
                                  </tr>
                                @endforeach
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                @endcan
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
  var myIssueID = {!! json_encode($issue->id) !!};
  var myUserID = {!! json_encode(auth()->user()->id) !!};
  var today_sw = {!! json_encode($today_sw) !!};

  var msgcolor = '';
  @if(auth()->user()->role_id == 1 || auth()->user()->role_id == 4)
    var trole_id = [2];
  @else
    var trole_id = [1, 4];
  @endif


  $(document).ready(function() {

    var pusher2 = new Pusher('5ba88ac776032a6dee24', {
      cluster: 'ap2'
    });

    var channel2 = pusher2.subscribe('my-channel');
    channel2.bind('my-event', function(data) {
      if (data.issue_id == myIssueID && data.user_id != myUserID) {
        if (today_sw == 0) {
          $('#divInbox').append(`
            <div class="row text-center ml-auto mr-auto">
              <div class="col-sm-12" style="padding-top: 15px; padding-bottom: 15px;">
                Today
              </div>
            </div>
          `);
          today_sw = 1;
        }

        if ($('#modalChat').is(':visible')) {
          setTimeout(function() { 
            $.ajaxSetup({
              headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
              }
            });
            $.ajax({
              data: { "issue_id" : myIssueID },
              url: "{{ route('readmessage') }}",
              type: "POST",
              dataType: 'json',
              success: function (data) {
                console.log('Success:', JSON.stringify(data));
              },
              error: function (data) {
                console.log('Error:', JSON.stringify(data));
              }
            });
          }, 100);
        } else {
          $('#btnChat').attr("style", "color: red !important;");
        }

        if (trole_id.includes(data.role_id)) {
          msgcolor = 'warning';
        } else {
          msgcolor = 'success';
        }

        $('#divInbox').append(`
          <div class="row">
            <div class="col-sm-6 mr-auto pad20msg">
              <div class="card-header card-header-` + msgcolor + `"">
                <p class="card-category">` + data.message + `</p>
              </div>
              <div class="card-footer">
                <div class="stats">
                  From: ` + data.username + `, ` + data.timestamp + `
                </div>
              </div>
            </div>
          </div>
        `);
        $("#modalChat .modal-body").animate({ scrollTop: $('#modalChat .modal-body').prop("scrollHeight")}, 'slow');
      }
    });

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
    $('#issueforActionA').hide();
    $('#new-btn').on('click', function() {
      $('#new-div').append('<br><div class="row" id="div_att_' + attachCtr + '"><label class="col-sm-3 col-form-label"></label><div class="col-sm-7"><div class="fileinputs"><div class="input-group"><input type="text" class="form-control" disabled><span class="btn btn-info btn-file btn-link btn-sm vert-allx"><i class="material-icons">attach_file</i><input type="file" name="attached_file[]" class="form-control" id="file_' + attachCtr + '"></span><span class="btn btn-success btn-link btn-sm vert-allx" onClick="openFile(\'file_' + attachCtr + '\')"><i class="material-icons">download</i></span><span class="btn btn-danger btn-link btn-sm vert-allx" onClick="removeDiv(\'div_att_' + attachCtr + '\')"><i class="material-icons">close</i></span></div></div></div></div>');
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

    @if($mtype == 1)
      showChat();
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

  $('#status').on('change', function() {
    if ($('#status').val() >= 2) {
      if ($('#status').val() == 6) {
        if (document.getElementById('div_resolver_id')) {
          document.getElementById('div_resolver_id').hidden = true;
        }
      } else {
        if (document.getElementById('div_resolver_id')) {
          document.getElementById('div_resolver_id').hidden = false;
        }
      }
    } else {
      if (document.getElementById('div_resolver_id')) {
        document.getElementById('div_resolver_id').hidden = true;
      }
    }

    if ($('#status').val() == 4) {
      if (document.getElementById('div_remarks')) {
        document.getElementById('div_remarks').hidden = false;
      }
    } else {
      if (document.getElementById('div_remarks')) {
        document.getElementById('div_remarks').hidden = true;
      }
    }

    if ($('#status').val() == 6) {
      if (document.getElementById('div_reason_for_rejection')) {
        document.getElementById('div_reason_for_rejection').hidden = false;
      }
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

  function updateOCEvent(myName) {
    document.getElementById('download_' + myName).href = "#";
    document.getElementById('download_' + myName).setAttribute( "onClick", "javascript: openFile('file_" + myName + "');" );
    document.getElementById('id_' + myName).value = "";

    // document.getElementById('download_' + myName).onClick = function() { openFile('file_' + myName); }
  }

  function removeValforOrg() {
    // console.log('DUmaan');
    document.getElementById('file_org').value = null;

    document.getElementById('id_org').value = "";
    document.getElementById('2file_org').value = null;

    document.getElementById('download_org').href = "#";
    document.getElementById('download_org').setAttribute( "onClick", "javascript: openFile('file_org');" );
  }

  function showToReopen() {
      document.getElementById('modalsetToReopen').hidden = false;
      $("#modalsetToReopen").modal("show");
  }

  function showToComplete() {
      document.getElementById('modalsetToComplete').hidden = false;
      $("#modalsetToComplete").modal("show");
  }

  function chColor(myID) {
    $("#rating").val(myID);
    for(x=1;x<=5;x++) {
      if (x <= myID) {
        $("#star" + x).attr('class', 'fa fa-star rating-color');
        if (x == myID) {
          if (x == 1) {
            msg = 'Very dissatisfied';
            txtcolor = 'red';
          } else if(x == 2) {
            msg = 'Dissatisfied';
            txtcolor = 'orange';
          } else if(x == 3) {
            msg = 'Satisfied';
            txtcolor = 'gray';
          } else if(x == 4) {
            msg = 'Very satisfied';
            txtcolor = 'lightgreen';
          } else if(x == 5) {
            msg = 'Outstanding';
            txtcolor = 'green';
          }
          $('#ratingDesc').attr('style', 'color: ' + txtcolor);
          $('#ratingDesc').text(msg);
        }
      } else {
        $("#star" + x).attr('class', 'fa fa-star');
      }
    }
  }

  function showLogs() {
    document.getElementById('modalLogs').hidden = false;
    $("#modalLogs").modal("show");
  }

  function showChat() {
    // $("#CssLoader").attr("hidden", false);
    $('#btnSend').attr("disabled", true);
    $('#inputMessage').attr("disabled", true);
    setTimeout(function() { 
      $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        data: { "issue_id" : myIssueID },
        url: "{{ route('readmessage') }}",
        type: "POST",
        dataType: 'json',
        success: function (data) {
          $('#btnChat').attr("style", "color: white !important;");
          document.getElementById('modalChat').hidden = false;
          $("#modalChat").modal("show");
          // console.log('Success:', JSON.stringify(data));
          // $("#CssLoader").attr("hidden", true);
          $('#btnSend').attr("disabled", false);
          $('#inputMessage').attr("disabled", false);
        },
        error: function (data) {
          console.log('Error:', JSON.stringify(data));
          // $("#CssLoader").attr("hidden", true);
          $('#btnSend').attr("disabled", false);
          $('#inputMessage').attr("disabled", false);
        }
      });
    }, 100);
  }

  $('#modalChat').on('shown.bs.modal', function () {
    $("#modalChat .modal-body").animate({ scrollTop: $('#modalChat .modal-body').prop("scrollHeight")}, 'slow');
    $('#inputMessage').focus();
  });

  // $('#modalChat').on('shown.bs.modal', function(event) {
  //   $('#modalChat .modal-body').scrollTop(0);
  //   var section = $(event.relatedTarget).data('section');
  //   var sectionOffset = $('#' + section).offset();
  //   $('#modalChat .modal-body').animate({
  //     scrollTop: sectionOffset.top - 30
  //   }, "slow");
  // });

  function ocSubmitRating() {
    let hit = 0;
    if($("#rating").val() <= 3) {
      if ($("#remarks_creator").val().trim() == '') {
        hit = 1;
        $.notify({
          icon: "close",
          message: "Please indicate your reason"
        }, {
          type: 'danger',
          z_index: 2000,
          timer: 3000,
          placement: {
            from: 'top',
            align: 'right'
          }
        });
        return false;
      }
    }

    if (hit == 0) {
      let x = $("#rating").val();
      if (x == 1) {
        msg = 'very dissatisfied';
      } else if(x == 2) {
        msg = 'dissatisfied';
      } else if(x == 3) {
        msg = 'neutral';
      } else if(x == 4) {
        msg = 'satisfied';
      } else if(x == 5) {
        msg = 'very satisfied';
      }

      if (confirm('Are you sure you want to submit a ' + msg + ' rating?')) {
        showCssLoader('btnSubmitRating');
        document.getElementById("formsetToComplete").submit();
      }
    }
  }

  $('#inputMessage').keypress(function (e) {
    if (e.which == 13) {
      ocBtnSend();
      // $('#inputMessage').val("");
      return false;
    }
  });

  function ocBtnSend() {
    var dbMessage = $('#inputMessage').val();
    if (dbMessage.trim() != '') {

      // $("#CssLoader").attr("hidden", false);
      $('#btnSend').attr("disabled", true);
      $('#inputMessage').attr("disabled", true);
      setTimeout(function() { 
        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        });
        $.ajax({
          data: { "issue_id" : myIssueID, "message" : JSON.stringify(dbMessage)},
          url: "{{ route('sendmessage') }}",
          type: "POST",
          dataType: 'json',
          success: function (data) {
            if (data.status == "success") {
              if (today_sw == 0) {
                $('#divInbox').append(`
                  <div class="row text-center ml-auto mr-auto">
                    <div class="col-sm-12" style="padding-top: 15px; padding-bottom: 15px;">
                      Today
                    </div>
                  </div>
                `);
                today_sw = 1;
              }

              $('#divInbox').append(`
                <div class="row">
                  <div class="col-sm-6 ml-auto pad20msg">
                    <div class="card-header card-header-info">
                      <p class="card-category">` + dbMessage + `</p>
                    </div>
                    <div class="card-footer">
                      <div class="stats">
                        From: Me, ` + data.data.myMsgTime + ` 
                      </div>
                    </div>
                  </div>
                </div>
              `);
              $('#inputMessage').val("");
            } else {
              console.log('Error:', JSON.stringify(data));
            }
            // $("#CssLoader").attr("hidden", true);
            $('#btnSend').attr("disabled", false);
            $('#inputMessage').attr("disabled", false);
            $("#modalChat .modal-body").animate({ scrollTop: $('#modalChat .modal-body').prop("scrollHeight")}, 'slow');
            $('#inputMessage').focus();
          },
          error: function (data) {
            console.log('Error:', JSON.stringify(data));
            // $("#CssLoader").attr("hidden", true);
            $('#btnSend').attr("disabled", false);
            $('#inputMessage').attr("disabled", false);
          }
        });
      }, 100);












      
      return false;
    }
  }
</script>
@endpush