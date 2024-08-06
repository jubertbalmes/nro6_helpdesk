@extends('layouts.app', ['activePage' => 'position-management', 'menuParent' => 'laravel', 'titlePage' => __('Position Management')])

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
                <h4 class="card-title">{{ __('Position') }}</h4>
              </div>
              <div class="card-body">
              @if (auth()-> user()->isAdmin())
                <div class="row">
                    <div class="col-12 text-right">
                      <a href="{{ route('position.create') }}" class="btn btn-sm btn-info">{{ __('Add Position') }}</a>
                    </div>
                  </div>
                @endif
                <div class="table-responsive">
                  <table id="datatables" class="table table-striped table-no-bordered table-hover" style="display:none">
                    <thead class="text-primary">
                      <th class="desktop">
                        {{ __('Description') }}
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
                      @foreach($positions as $position)
                        <tr>
                          <td>
                            {{ $position->position }}
                          </td>
                          <td>
                            {{ $position->created_at->format('Y-m-d') }}
                          </td>
                          @if (auth()-> user()->isAdmin())
                            <td class="td-actions text-right">
                              <form action="{{ route('position.destroy', $position) }}" method="post">
                                @csrf
                                @method('delete')

                                @if (auth()-> user()->isAdmin())
                                  <a rel="tooltip" class="btn btn-success btn-link" href="{{ route('position.edit', $position) }}" data-original-title="" title="">
                                    <i class="material-icons">edit</i>
                                    <div class="ripple-container"></div>
                                  </a>
                                @endif
                                @if (auth()-> user()->isAdmin())
                                  <button type="button" class="btn btn-danger btn-link" data-original-title="" title="" onclick="confirm('{{ __("Are you sure you want to delete this position?") }}') ? this.parentElement.submit() : ''">
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
        searchPlaceholder: "Search positions",
      },
      "columnDefs": [
        { "orderable": false, "targets": 3 },
      ],
    });
  });
</script>
@endpush