@extends('layouts.app', ['activePage' => 'view-request', 'menuParent' => 'issues', 'titlePage' => __('View Issues & Requests')])

@section('content')
<div class="content rempm">
    <div class="container-fluid">
      <div class="row">

        <div id="CssLoader">
          <div class='spinftw'></div>
        </div>


        <div class="col-md-3 ml-auto mr-auto">
          <div class="card card-stats">
            <div class="card-header card-header-success card-header-icon">
              <div class="card-icon">
                <i class="fa fa-globe"></i>
              </div>
              <p class="card-category">Overall<br>Ticket</p>
              <h3 class="card-title"><a href="{{ route('issue.index') }}" style="color:black;">{{ auth()->user()->totalTicket() }}</a></h3>
            </div>
            <div class="card-footer">
              <div class="stats">
                as of today ({{ date('F j, Y') }})
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 ml-auto mr-auto">
          <div class="card card-stats">
            <div class="card-header card-header-warning card-header-icon">
              <div class="card-icon">
                <i class="fa fa-hourglass-end"></i>
              </div>
              <p class="card-category">Ongoing<br>Ticket</p>
              {{-- <h3 class="card-title">{{ $pending }}</h3> --}}
              <h3 class="card-title"><a href="{{ route('pendingIssues') }}" style="color:black;">{{ auth()->user()->pendingTicket() }}</a></h3>
            </div>
            <div class="card-footer">
              <div class="stats">
                as of today ({{ date('F j, Y') }})
              </div>
            </div>
          </div>
        </div>
        
        @if (auth()->user()->isMember())
          <div class="col-md-3 ml-auto mr-auto">
            <div class="card card-stats">
              <div class="card-header card-header-info card-header-icon">
                <div class="card-icon">
                  <i class="material-icons">fact_check</i>
                </div>
                <p class="card-category">Completed<br>Ticket</p>
                {{-- <h3 class="card-title">{{ $pending }}</h3> --}}
                <h3 class="card-title"><a href="{{ route('completedIssues') }}" style="color:black;">{{ auth()->user()->completedTicket() }}</a></h3>
              </div>
              <div class="card-footer">
                <div class="stats">
                  as of today ({{ date('F j, Y') }})
                </div>
              </div>
            </div>
          </div>
        @else
          <div class="col-md-3 ml-auto mr-auto">
            <div class="card card-stats">
              <div class="card-header card-header-rose card-header-icon">
                <div class="card-icon">
                  <i class="fa fa-exclamation"></i>
                </div>
                <p class="card-category">Delayed<br>Ticket</p>
                {{-- <h3 class="card-title">{{ $pastdue }}</h3> --}}
                <h3 class="card-title"><a href="{{ route('pastDueIssues') }}" style="color:black;">{{ auth()->user()->delayedTicket() }}</a></h3>
              </div>
              <div class="card-footer">
                <div class="stats">
                  as of today ({{ date('F j, Y') }})
                </div>
              </div>
            </div>
          </div>
        @endif
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="card mb-8">
            <div class="card-header card-header-rose card-neda">
              <div class="card-body">
                <div class="row">
                  <i class="material-icons">assignment</i>

                  {{-- <div id="pst-time"></div> --}}
                  <h4 class="card-titleX">{{ __('Tickets') }}@if($type == 1) {{ __(' - Ongoing') }} @elseif($type == 2) {{ __(' - Delayed') }} @elseif($type == 3) {{ ' - Completed (' . auth()->user()->completedArchivedTickets() . ' on archive)' }} @elseif($type == 4) {{ ' - Today (' . auth()->user()->todayArchivedTickets() . ' on archive)' }} @elseif($type == 5) {{ ' - This Month (' . auth()->user()->thisMonthArchivedTickets() . ' on archive)' }} @elseif($type == 6) {{ ' - This Quarter (' . auth()->user()->thisQuarterArchivedTickets() . ' on archive)' }} @elseif($type == 7) {{ ' - This Year (' . auth()->user()->thisYearArchivedTickets() . ' on archive)' }} @else {{ ' (' . auth()->user()->totalArchivedTicket() . ' on archive)' }} @endif</h4>
                </div>
              </div>
            </div>
  
              <div class="card-body">
                @can('create_issue', App\User::class)
                  <div class="row">
                    <div class="col-12 text-right">
                      <a href="{{ route('issue.create') }}" class="btn btn-sm btn-info">{{ __('Create') }}</a>
                    </div>
                  </div>
                @endcan
                <div class="table-responsive">
                  <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                    <thead class="text-primary">
                      <th class="desktop">
                        {{ __('Reference #') }}
                      </th>
                      <th class="desktop">
                        {{ __('Reported By') }}
                      </th>
                      <th class="desktop">
                        {{ __('Issue/Request') }}
                      </th>
                      <th class="desktop">
                        {{ __('Priority') }}
                      </th>
                      <th class="desktop">
                        {{ __('Status') }}
                      </th>
                      <th class="desktop">
                        {{ __('Assigned To') }}
                      </th>
                      <th class="desktop">
                        {{ __('') }}
                      </th>
                      <th class="desktop">
                        {{ __('Created At') }}
                      </th>
                      {{-- <th class="desktop">
                        {{ __('Updated At') }}
                      </th> --}}
                      <th class="text-center desktop">
                        {{ __('Actions') }}
                      </th>
                    </thead>
                    <tbody>
                      @foreach($issues as $issue)
                        @can('view', $issue)
                          <tr>
                            <td class="text-left">
                              {{ $issue->reff_no }}
                              @can('actionRequired', $issue)
                                {{-- <a rel="tooltip" class="btn btn-danger btn-link btn-sm vert-all" href="{{ route('issue.edit', encrypt($issue->id)) }}" data-original-title="" title="">
                                  <i class="material-icons">notifications</i>
                                </a> --}}

                                
                                <a rel="tooltip" class="btn-link btn-sm" style="padding-right: 5px; padding-left: 5px;">
                                  <i class="fa fa-exclamation text-danger" aria-hidden="true"></i>
                                </a>
                              @endcan
                              @if($issue->hasMessage()) 
                                <a rel="tooltip" class="btn-link btn-sm" style="padding-right: 5px; padding-left: 5px;" href="{{ route('view.message', ['id' => encrypt($issue->id), 'mtype' => 1]) }}">
                                  <i class="fa fa-comments-o text-info" aria-hidden="true"></i>
                                </a>
                              @endif
                            </td>
                            <td class="align-top">
                              {{ $issue->user->name }}
                            </td>
                            <td>
                              @if($issue->category_id == null)
                                {{ $issue->category_id }}
                              @else
                                {{ $issue->category->name }}
                              @endif
                            </td>
                            <td>
                              {{ $issue->prioritydesc() }}
                            </td>
                            <td>
                              {{ $issue->mstatus->status }}
                            </td>
                            <td>
                              @if($issue->resolver_id == null)
                                {{ $issue->resolver_id }}
                              @else
                                {{ $issue->resolver->name }} 
                              @endif
                            </td>
                            <td>
                              @if($issue->resolver_id != null)
                                <span style="color: @if($issue->resolver->status == 1) #09b826 @else gray @endif;" ><i class="fa fa-circle"></i></span>
                              @endif
                            </td>
                            {{-- <td>
                              {{ $issue->created_at->format('Y-m-d h:m:s A') }}
                            </td> --}}
                            <td>
                              {{ $issue->created_at->format('Y-m-d h:i:s A') }}
                            </td>
                            <td class="td-actions text-center">
                              <form action="{{ route('issue.destroy', $issue) }}" method="post">
                                @csrf
                                @method('delete')
                                @can('edit', $issue)
                                  <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('issue.edit', encrypt($issue->id)) }}" data-original-title="" title="">
                                    @canany(['update', 'reOpenComplete'], $issue)
                                      <i title="Edit" class="material-icons">edit</i>
                                    @else
                                      <i title="View" class="material-icons">remove_red_eye</i>
                                    @endcanany
                                    <div class="ripple-container"></div>
                                  </a>
                                @endcan
                                @can('archive', $issue)
                                  <button type="button" class="btn btn-warning btn-link" data-original-title="" onclick="confirm('{{ __("Are you sure you want to archive this issue?") }}') ? this.parentElement.submit() : ''">
                                    <i title="Archive" class="material-icons">delete_outline</i>
                                    <div class="ripple-container"></div>
                                  </button>
                                @endcan
                              </form>
                            </td>
                          </tr>
                        @endcan
                      @endforeach
                    </tbody>
                  </table>
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
  var holidayDays = {!! json_encode($holidayDays) !!};
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
    @elseif($errors->has('ticket_warning'))
      $.notify({
        icon: "warning",
        message: "{{ $errors->first('ticket_warning') }}"
      }, {
        type: 'warning',
        timer: 3000,
        placement: {
          from: 'top',
          align: 'right'
        }
      });
    @endif
    $('#issueforActionA').hide();
    $('#datatables').fadeIn(1100);
    $('#datatables').DataTable({
      "order": [[0, 'desc']],
      "pagingType": "full_numbers",
      "lengthMenu": [
        [10, 25, 50, -1],
        [10, 25, 50, "All"]
      ],
      responsive: false,
      language: {
        search: "_INPUT_",
        searchPlaceholder: "Search Tickets",
      },
      "columnDefs": [
        { "orderable": false, "targets": [6, 8] },
      ],
    });
    @if(auth()->user()->isMember()) 
      // console.log('Wala');
      announcement();
    @endif
  });
</script>
@endpush