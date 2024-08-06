@extends('layouts.app', ['activePage' => 'organization-management', 'menuParent' => 'laravel', 'titlePage' => __('Organization Management')])

@section('content')
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
            <div class="card">
              <div class="card-header card-header-info card-header-icon">
                <div class="card-icon">
                  <i class="material-icons">recent_actors</i>
                </div>
                <h4 class="card-title">{{ __('Organization') }}</h4>
              </div>
              <div class="card-body">
              @if (auth()-> user()->isAdmin())
                  <div class="row">
                    <div class="col-12 text-right">
                      <a href="{{ route('organization.create') }}" class="btn btn-sm btn-info">{{ __('Add Organization') }}</a>
                    </div>
                  </div>
                @endif
                <div class="table-responsive">
                  <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                    <thead class="text-primary">

                    <th class="desktop">
                          {{ __('Organizational Code') }}
                      </th>
                      <th class="desktop">
                          {{ __('Short Name') }}
                      </th>
                      <th class="desktop">
                          {{ __('Organizational Name') }}
                      </th>
                      <th class="desktop">
                        {{ __('Creation date') }}
                      </th>
                      @if (auth()-> user()->isAdmin())
                        <th class="text-right desktop">
                          {{ __('Actions') }}
                        </th>
                      @endif
                    </thead>
                    <tbody>
                      @foreach($organizations as $organization)
                        <tr>
                        <td>
                            {{ $organization->org_code }}
                          </td>
                          <td>
                            {{ $organization->short_name }}
                          </td>
                          <td>
                            {{ $organization->name }}
                          </td>
                    
                          <td>
                              @if($organization->created_at != null)
                            {{ $organization->created_at->format('Y-m-d') }}
                              @endif
                          </td>
                          @if (auth()-> user()->isAdmin())
                            <td class="td-actions text-right">
                              <form action="{{ route('organization.destroy', $organization) }}" method="post">
                                @csrf
                                @method('delete')

                          @if (auth()-> user()->isAdmin())
                                  <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('organization.edit', $organization) }}" data-original-title="" title="">
                                    <i class="material-icons">edit</i>
                                    <div class="ripple-container"></div>
                                  </a>
                                @endif
                                @if (auth()-> user()->isAdmin())
                                  <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this organization?") }}') ? this.parentElement.submit() : ''">
                                      <i class="material-icons">close</i>
                                      <div class="ripple-container"></div>
                                  </button>
                                @endif
                              </form>
                            </td>
                          @endif
                        </tr>
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
  $(document).ready(function() {
    $('#datatables').fadeIn(1100);
    $('#datatables').DataTable({
      "pagingType": "full_numbers",
      "lengthMenu": [
        [10, 25, 50, -1],
        [10, 25, 50, "All"]
      ],
      responsive: true,
      language: {
        search: "_INPUT_",
        searchPlaceholder: "Search organizations",
      },
      "columnDefs": [
        { "orderable": false, "targets": 3 },
      ],
    });
  });
</script>
@endpush