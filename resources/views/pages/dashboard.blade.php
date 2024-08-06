@extends('layouts.app', ['activePage' => 'dashboard', 'menuParent' => 'dashboard', 'titlePage' => __('Dashboard')])

@section('content')
<div class="content rempm">
  <div class="container-fluid">
    <div class="row">

      <div id="CssLoader">
        <div class='spinftw'></div>
      </div>


      <div class="col-md-12">
        <div class="col-md-12">
          <div class="card mb-8">
            <div class="card-header card-header-info card-neda">
              <div class="card-body">
                <div class="row">
                  <i class="material-icons">dashboard</i>
                  <h4 class="card-titleX">{{ __('ICTS - HelpDesk Dashboard') }}</h4>
                </div>
              </div>
            </div>
            <div class="card-body">
              {{-- <div class="row">
                <div class="col-md-3 ml-auto mr-auto">
                  <div class="card card-stats">
                    <div class="card-header card-header-success card-header-icon">
                      <div class="card-icon">
                        <i class="fa fa-globe"></i>
                      </div>
                      <p class="card-category">Overall<br>Tickets</p>
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
                      <p class="card-category">Ongoing<br>Tickets</p>
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
                        <p class="card-category">Completed<br>Tickets</p>
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
                        <p class="card-category">Delayed<br>Tickets</p>
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
              </div> --}}

              <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 ml-auto mr-auto">
                  <div class="card card-stats">
                    <div class="card-header card-header-success card-header-icon">
                      <div class="card-icon">
                        <i class="fa fa-calendar-check-o"></i>
                      </div>
                      <p class="card-category">Ticket @if(auth()->user()->isAdmin() || auth()->user()->isHOD()) Recieved @elseif(auth()->user()->isAdmin()) Assigned @else Submitted @endif<br>Today</p>
                      <h3 class="card-title"><a href="{{ route('issuesToday') }}" style="color:black;">{{ auth()->user()->todayTickets() }}</a></h3>
                    </div>
                    <div class="card-footer">
                      <div class="stats">
                        {{ 'Date: ' . date('F jS') }}
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 ml-auto mr-auto">
                  <div class="card card-stats">
                    <div class="card-header card-header-warning card-header-icon">
                      <div class="card-icon">
                        <i class="fa fa-calendar"></i>
                      </div>
                      <p class="card-category">Ticket @if(auth()->user()->isAdmin() || auth()->user()->isHOD()) Recieved @elseif(auth()->user()->isAdmin()) Assigned @else Submitted @endif<br>this Month</p>
                      <h3 class="card-title"><a href="{{ route('issuesThisMonth') }}" style="color:black;">{{ auth()->user()->thisMonthTickets() }}</a></h3>
                    </div>
                    <div class="card-footer">
                      <div class="stats">
                        {{ 'Month: ' . date('F') }}
                      </div>
                    </div>
                  </div>
                </div>
                
                
                <div class="col-lg-3 col-md-6 col-sm-6 ml-auto mr-auto">
                  <div class="card card-stats">
                    <div class="card-header card-header-info card-header-icon">
                      <div class="card-icon">
                        <i class="material-icons">today</i>
                      </div>
                      <p class="card-category">Ticket @if(auth()->user()->isAdmin() || auth()->user()->isHOD()) Recieved @elseif(auth()->user()->isAdmin()) Assigned @else Submitted @endif<br>this Quarter</p>
                      <h3 class="card-title"><a href="{{ route('issuesThisQuarter') }}" style="color:black;">{{ auth()->user()->thisQuarterTickets() }}</a></h3>
                    </div>
                    <div class="card-footer">
                      <div class="stats">
                        {{ 'Quarter: ' . ceil(date('n', time()) / 3) }}
                      </div>
                    </div>
                  </div>
                </div>
                
                
                <div class="col-lg-3 col-md-6 col-sm-6 ml-auto mr-auto">
                  <div class="card card-stats">
                    <div class="card-header card-header-primary card-header-icon">
                      <div class="card-icon">
                        <i class="material-icons">calendar_today</i>
                      </div>
                      <p class="card-category">Ticket @if(auth()->user()->isAdmin() || auth()->user()->isHOD()) Recieved @elseif(auth()->user()->isAdmin()) Assigned @else Submitted @endif<br>this Year</p>
                      <h3 class="card-title"><a href="{{ route('issuesThisYear') }}" style="color:black;">{{ auth()->user()->thisYearTickets() }}</a></h3>
                    </div>
                    <div class="card-footer">
                      <div class="stats">
                        {{ 'Year: ' . date('Y') }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>














              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="4000">
                {{-- <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol> --}}
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="col-md-8 ml-auto mr-auto">
                      <canvas id="myChartStatusMain"></canvas>
                    </div>
                    {{-- <div class="carousel-caption d-none d-md-block">
                      <h5>First slide label</h5>
                      <p>Lorem Ipsum</p>
                    </div> --}}
                  </div>
                  <div class="carousel-item">
                    <div class="col-md-8 ml-auto mr-auto">
                      <canvas id="myChartStatus"></canvas>
                    </div>
                    {{-- <div class="carousel-caption d-none d-md-block">
                      <h5>Second slide label</h5>
                      <p>Dolor Sit Amet</p>
                    </div> --}}
                  </div>
                  <div class="carousel-item">
                    <div class="col-md-8 ml-auto mr-auto">
                      <canvas id="myChartTicket"></canvas>
                    </div>
                    {{-- <div class="carousel-caption d-none d-md-block">
                      <h5>Third slide labe</h5>
                      <p>Consectetur adipiscing elit</p>
                    </div> --}}
                  </div>
                  @if(auth()->user()->isAdmin() || auth()->user()->isHOD())
                    <div class="carousel-item">
                      <div class="col-md-8 ml-auto mr-auto">
                        <canvas id="myChartPendingTech"></canvas>
                      </div>
                      {{-- <div class="carousel-caption d-none d-md-block">
                        <h5>Forth slide labe</h5>
                        <p>Quick brown fox</p>
                      </div> --}}
                    </div>
                    <div class="carousel-item">
                      <div class="col-md-8 ml-auto mr-auto">
                        <canvas id="myChartStatusTech"></canvas>
                      </div>
                      {{-- <div class="carousel-caption d-none d-md-block">
                        <h5>Fifth slide labe</h5>
                        <p>Jumps over the lazy dog</p>
                      </div> --}}
                    </div>


                    {{-- <div class="carousel-item">
                      <div class="col-md-8 ml-auto mr-auto">
                        <canvas id="myChartMonthlyRating"></canvas>
                      </div>
                    </div> --}}

                    @if (ceil(date("n") / 3) >= 1)
                      <div class="carousel-item">
                        <div class="col-md-8 ml-auto mr-auto">
                          <canvas id="myChartQ1Rating"></canvas>
                        </div>
                      </div>
                    @endif
                    @if (ceil(date("n") / 3) >= 2)
                      <div class="carousel-item">
                        <div class="col-md-8 ml-auto mr-auto">
                          <canvas id="myChartQ2Rating"></canvas>
                        </div>
                      </div>
                    @endif
                    @if (ceil(date("n") / 3) >= 3)
                      <div class="carousel-item">
                        <div class="col-md-8 ml-auto mr-auto">
                          <canvas id="myChartQ3Rating"></canvas>
                        </div>
                      </div>
                    @endif
                    @if (ceil(date("n") / 3) >= 4)
                      <div class="carousel-item">
                        <div class="col-md-8 ml-auto mr-auto">
                          <canvas id="myChartQ4Rating"></canvas>
                        </div>
                      </div>
                    @endif
                  @endif
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>













              {{-- <div class="row">
                <div class="col-md-11 ml-auto mr-auto">
                  <canvas id="myChartStatusMain"></canvas>
                </div>
              </div>


              <br>
              <br>
              <br>
              <div class="row">
                <div class="col-md-6 ml-auto mr-auto">
                  <canvas id="myChartStatus"></canvas>
                </div>
                <div class="col-md-6 ml-auto mr-auto">
                  <canvas id="myChartTicket"></canvas>
                </div>
              </div>
              @if(auth()->user()->isAdmin() || auth()->user()->isHOD())
                <br>
                <br>
                <br>
                <div class="row">
                  <div class="col-md-6 ml-auto mr-auto">
                    <canvas id="myChartPendingTech"></canvas>
                  </div>
                  <div class="col-md-6 ml-auto mr-auto">
                    <canvas id="myChartStatusTech"></canvas>
                  </div>
                </div>
              @endif --}}
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <p>ICTS help desk is a program used to process, manage, and track IT related issues from submission to resolution. It automatically organize and prioritize support requests in a central dashboard. Helpdesk officer can tag, categorize, and assign tickets as they come in. It also indicate ticket status so you can keep tabs on active requests.</p>
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

    
    var myChartMain = null;
    var myChartStatus = null;
    var myChartTicket = null;
    var myChartTechTicket = null;
    var myChartTechPending = null;
    var myChartQ1Rating = null;
    var myChartQ2Rating = null;
    var myChartQ3Rating = null;
    var myChartQ4Rating = null;
    var labels = [];

    
    var dateToday = {!! json_encode(date('F j, Y')) !!};
    var total = {!! json_encode(auth()->user()->totalTicket()) !!};
    var submitted7days = {!! json_encode($submitted7days) !!};
    var byStatus = {!! json_encode($byStatus) !!};
    var techInit = {!! json_encode($techInit) !!};
    var techsubmitted = {!! json_encode($techsubmitted) !!};
    var techassigned = {!! json_encode($techassigned) !!};
    var techongoing = {!! json_encode($techongoing) !!};
    var techresolved = {!! json_encode($techresolved) !!};
    var techcompleted = {!! json_encode($techcompleted) !!};
    var techrejected = {!! json_encode($techrejected) !!};
    var techreopened = {!! json_encode($techreopened) !!};
    var techontrack = {!! json_encode($techontrack) !!};
    var techdelayed = {!! json_encode($techdelayed) !!};
    var pendingTicket = {!! json_encode(auth()->user()->pendingTicket()) !!};
    var delayedTicket = {!! json_encode(auth()->user()->delayedTicket()) !!};
    var q1RData = {!! json_encode($q1RData) !!};
    var q2RData = {!! json_encode($q2RData) !!};
    var q3RData = {!! json_encode($q3RData) !!};
    var q4RData = {!! json_encode($q4RData) !!};
    // Chart.register(ChartjsPluginStacked100.default);



    const date = new Date();
    var rateMonth = [];
    for (x=1;x<=new Date().getMonth()+1;x++) {
      date.setMonth(x - 1);
      rateMonth.push(date.toLocaleString('default', { month: 'short' }));
    }

    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();
      md.initVectorMap();

      
      for (x=8;x>=0;x--) {
          cdate = new Date(new Date().setDate(new Date().getDate() - x));
          labels.push(String(cdate).substring(10, 4));
      }

      generatemyChartMain();
      generatemyChartStatus();
      generatemyChartTicket();
      @if(auth()->user()->isAdmin() || auth()->user()->isHOD())
        generatemyChartTechTicket();
        generatemyChartTechPending();
        // generatemyChartMonthlyRating();

        @if (ceil(date("n") / 3) >= 1)
          generatemyChartQ1Rating();
        @endif
        @if (ceil(date("n") / 3) >= 2)
          generatemyChartQ2Rating();
        @endif
        @if (ceil(date("n") / 3) >= 3)
          generatemyChartQ3Rating();
        @endif
        @if (ceil(date("n") / 3) >= 4)
          generatemyChartQ4Rating();
        @endif
      @endif
    });

    function roundUpNearest5(num) {
      return Math.ceil(num / 5) * 5;
    }

    function generatemyChartMain() {
      myChartMain = new Chart(
        document.getElementById('myChartStatusMain'),
        {
          type: 'bar',
          data: 
          {
            labels: [
              'Submitted',
              'Assigned',
              'Ongoing',
              'Resolved',
              'Completed',
              'Rejected',
              'Reopened'
            ],
            datasets: [{
              data: byStatus,
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(0, 0, 0, 0.2)'
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(0, 0, 0, 1)'
              ],
              borderWidth: 1,
              hoverOffset: 4
            }]
          },
          options: {
            // maintainAspectRatio: true,
            // aspectRatio: 1,
            plugins: {
              title: {
                display: true,
                text: 'Overall Ticket by Status'
              },
              legend: {
                display: false,
                position: 'right',
              },
              tooltip: {
                enabled: true,
              },
              datalabels: {
                anchor: 'center',
                align: 'center',
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },
            scales: {
              y: {
                beginAtZero: true,
                min: 0,
                grace: 5,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartStatus() {
      myChartStatus = new Chart(
        document.getElementById('myChartStatus'),
        {
          type: 'line',
          data: 
          {
            labels: labels,
            datasets: [{
              label: 'Submitted Ticket',
              backgroundColor: 'rgb(244, 164, 96, 0.2)',
              borderColor: 'rgb(139, 69, 19, 1)',
              borderWidth: 1,
              data: submitted7days,
            }]
          },
          options: {
            // maintainAspectRatio: true,
            // aspectRatio: 1,
            plugins: {
              title: {
                display: true,
                text: 'Total Submitted Ticket for the last 9 days'
              },
              legend: {
                display: false,
                position: 'top',
              },
              datalabels: {
                anchor: 'end',
                align: 'top',
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },


            scales: {
              y: {
                beginAtZero: true,
                min: 0,
                // max: parseInt(roundUpNearest5(total) + 5),
                grace: 5,
                // ticks: {
                //   stepSize: 1
                // }
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartTicket() {
      myChartTicket = new Chart(
        document.getElementById('myChartTicket'),
        {
          type: 'bar',
          data: {
            labels: ['Ongoing(Overall)', 'Delayed'],
            datasets: [{
              data: [pendingTicket, delayedTicket],
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              barThickness: 125,
              hoverOffset: 4
            }]
          },
          options: {
            // maintainAspectRatio: true,
            // aspectRatio: 1,
            plugins: {
              title: {
                display: true,
                text: 'Overall Pending Tickets'
              },
              legend: {
                display: false,
                position: 'right',
              },
              datalabels: {
                anchor: 'end',
                align: 'top',
                formatter: (value, context) => {
                  const datasetArray = [];
                  context.chart.data.datasets.forEach((dataset) => {
                    if (dataset.data[context.dataIndex] != undefined) {
                      datasetArray.push(dataset.data[context.dataIndex]);
                    }
                  });
                  // console.log(datasetArray);
                  function totalSum(total, datapoint) {
                    return total + datapoint;
                  }

                  let sum = datasetArray.reduce(totalSum, 0);

                  if (context.datasetIndex === datasetArray.length - 1) {
                    if (sum == 0) {
                      return '';
                    } else {
                      return sum;
                    }
                  } else {
                    return '';
                  }
                }
              }
            },
            scales: {
              // x: {
              //   stacked: true,
              // },
              y: {
                grace: 5,
                stacked: true,
                beginAtZero: true,
                min: 0,
              },
              xAxes: {
                
                stacked: true,
                barPercentage: 0.4
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartTechTicket() {
      myChartTechTicket = new Chart(
        document.getElementById('myChartStatusTech'),
        {
          type: 'bar',
          data: {
            labels: techInit,
            datasets: [{
              label: 'Submitted',
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              data: techsubmitted,
            },
            {
              label: 'Assigned',
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
              ],
              borderWidth: 1,
              data: techassigned,
            },
            {
              label: 'Ongoing',
              backgroundColor: [
                'rgba(255, 206, 86, 0.2)',
              ],
              borderColor: [
                'rgba(255, 206, 86, 1)',
              ],
              borderWidth: 1,
              data: techongoing,
            },
            {
              label: 'Resolved',
              backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1,
              data: techresolved,
            },
            {
              label: 'Completed',
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 1,
              data: techcompleted,
            },
            {
              label: 'Rejected',
              backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              data: techrejected,
            },
            {
              label: 'Reopened',
              backgroundColor: [
                'rgba(0, 0, 0, 0.2)'
              ],
              borderColor: [
                'rgba(0, 0, 0, 1)'
              ],
              borderWidth: 1,
              data: techreopened,
            }]
          },
          options: {
            // maintainAspectRatio: true,
            // aspectRatio: 1,
            plugins: {
              title: {
                display: true,
                text: 'Ticket by Status by Technician'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                anchor: 'end',
                align: 'top',
                formatter: (value, context) => {
                  const datasetArray = [];
                  context.chart.data.datasets.forEach((dataset) => {
                    if (dataset.data[context.dataIndex] != undefined) {
                      datasetArray.push(dataset.data[context.dataIndex]);
                    }
                  });
                  // console.log(datasetArray);
                  function totalSum(total, datapoint) {
                    return total + datapoint;
                  }

                  let sum = datasetArray.reduce(totalSum, 0);

                  if (context.datasetIndex === datasetArray.length - 1) {
                    if (sum == 0) {
                      return '';
                    } else {
                      return sum;
                    }
                  } else {
                    return '';
                  }
                }
              }
            },
            scales: {
              x: {
                stacked: true,
              },
              y: {
                grace: 5,
                stacked: true,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartTechPending() {
      myChartTechPending = new Chart(
        document.getElementById('myChartPendingTech'),
        {
          type: 'bar',
          data: {
            labels: techInit,
            datasets: [{
              label: 'On Track',
              backgroundColor: [
                'rgba(255,159,0, 0.2)',
              ],
              borderColor: [
                'rgba(203,65,11, 1)',
              ],
              borderWidth: 1,
              data: techontrack,
            },
            {
              label: 'Delayed',
              backgroundColor: [
                'rgba(249,132,239, 0.2)',
              ],
              borderColor: [
                'rgba(207,52,118, 1)',
              ],
              borderWidth: 1,
              data: techdelayed,
            }]
          },
          options: {
            // maintainAspectRatio: true,
            // aspectRatio: 1,
            plugins: {
              title: {
                display: true,
                text: 'Pending Ticket by Technician'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                anchor: 'end',
                align: 'top',
                formatter: (value, context) => {
                  const datasetArray = [];
                  context.chart.data.datasets.forEach((dataset) => {
                    if (dataset.data[context.dataIndex] != undefined) {
                      datasetArray.push(dataset.data[context.dataIndex]);
                    }
                  });
                  // console.log(datasetArray);
                  function totalSum(total, datapoint) {
                    return total + datapoint;
                  }

                  let sum = datasetArray.reduce(totalSum, 0);

                  if (context.datasetIndex === datasetArray.length - 1) {
                    if (sum == 0) {
                      return '';
                    } else {
                      return sum;
                    }
                  } else {
                    return '';
                  }
                }
              }
            },
            scales: {
              x: {
                stacked: true,
              },
              y: {
                grace: 5,
                stacked: true,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartMonthlyRating() {
      //   const topLabels = {
      //     id: 'topLabels',
      //     afterDatasetsDraw(chart, args, pluginOptions) {
      //       const { ctx, scales: { x, y } } = chart;



      //       chart.data.datasets[0].data.forEach((datapoint, index) => {
      //         const datasetArray = [];
      //         chart.data.datasets.forEach((dataset) => {
      //           datasetArray.push(dataset.data[index])
      //         })

      //         function totalSum(total, values) {
      //           return total + values;
      //         };

      //         let sum = datasetArray.reduce(totalSum, 0);
      //         if (sum == 0) {
      //           sum = '';
      //         }

      //         ctx.font = 'bold 12px sans-serif';
      //         ctx.fillStyle = 'gray';
      //         ctx.textAlign = 'center';
      //         ctx.fillText(sum, x.getPixelForValue(index), chart.getDatasetMeta(4).data[index].y - 10);

      //       })

            
      //     }
      //   }
      //   myChartMonthlyRating = new Chart(
      //     document.getElementById('myChartMonthlyRating'),
      //     {
      //       type: 'bar',
      //       data: {
      //         labels: rateMonth,
      //         datasets: [{
      //           label: 'Very Unsatisfied',
      //           backgroundColor: [
      //             'rgba(255, 26, 104, 0.2)',
      //           ],
      //           borderColor: [
      //             'rgba(255, 26, 104, 1)',
      //           ],
      //           borderWidth: 1,
      //           data: tmpy[0],
      //         },
      //         {
      //           label: 'Unsatisfied',
      //           backgroundColor: [
      //             'rgba(54, 162, 235, 0.2)',
      //           ],
      //           borderColor: [
      //             'rgba(54, 162, 235, 1)',
      //           ],
      //           borderWidth: 1,
      //           data: tmpy[1],
      //         },
      //         {
      //           label: 'Neutral',
      //           backgroundColor: [
      //             'rgba(75, 192, 192, 0.2)',
      //           ],
      //           borderColor: [
      //             'rgba(75, 192, 192, 1)',
      //           ],
      //           borderWidth: 1,
      //           data: tmpy[2],
      //         },
      //         {
      //           label: 'Satisfied',
      //           backgroundColor: [
      //             'rgba(153, 102, 255, 0.2)',
      //           ],
      //           borderColor: [
      //             'rgba(153, 102, 255, 1)',
      //           ],
      //           borderWidth: 1,
      //           data: tmpy[3],
      //         },
      //         {
      //           label: 'Very Satisfied',
      //           backgroundColor: [
      //             'rgba(255, 159, 64, 0.2)',
      //           ],
      //           borderColor: [
      //             'rgba(255, 159, 64, 1)',
      //           ],
      //           borderWidth: 1,
      //           data: tmpy[4],
      //         }]
      //       },
      //       options: {
      //         plugins: {
      //           title: {
      //             display: true,
      //             text: 'Monthly Rating Report'
      //           },
      //           legend: {
      //             display: true,
      //             position: 'right',
      //           },
      //           datalabels: {
      //             formatter: (value, context) => {
      //               if (value == 0) {
      //                 return '';
      //               } else {
      //                 return value;
      //               }
      //             }
      //           }
      //         },
      //         scales: {
      //           x: {
      //             stacked: true,
      //           },
      //           y: {
      //             grace: 5,
      //             stacked: true,
      //             beginAtZero: true,
      //             min: 0,
      //           }
      //         }
      //       },
      //       plugins: [ChartDataLabels, topLabels]
      //     }
      //   );
    }

    function generatemyChartQ1Rating() {
      myChartQ1Rating = new Chart(
        document.getElementById('myChartQ1Rating'),
        {
          type: 'bar',
          data: {
            labels: ['Jan', 'Feb', 'Mar'],
            datasets: [{
              label: 'Very Unsatisfied',
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              data: q1RData[0],
            },
            {
              label: 'Unsatisfied',
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
              ],
              borderWidth: 1,
              data: q1RData[1],
            },
            {
              label: 'Neutral',
              backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1,
              data: q1RData[2],
            },
            {
              label: 'Satisfied',
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 1,
              data: q1RData[3],
            },
            {
              label: 'Very Satisfied',
              backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              data: q1RData[4],
            }]
          },
          options: {
            plugins: {
              title: {
                display: true,
                text: 'Q1 Rating Report'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },
            scales: {
              y: {
                grace: 5,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartQ2Rating() {
      myChartQ2Rating = new Chart(
        document.getElementById('myChartQ2Rating'),
        {
          type: 'bar',
          data: {
            labels: ['Apr', 'May', 'Jun'],
            datasets: [{
              label: 'Very Unsatisfied',
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              data: q2RData[0],
            },
            {
              label: 'Unsatisfied',
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
              ],
              borderWidth: 1,
              data: q2RData[1],
            },
            {
              label: 'Neutral',
              backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1,
              data: q2RData[2],
            },
            {
              label: 'Satisfied',
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 1,
              data: q2RData[3],
            },
            {
              label: 'Very Satisfied',
              backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              data: q2RData[4],
            }]
          },
          options: {
            plugins: {
              title: {
                display: true,
                text: 'Q2 Rating Report'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },
            scales: {
              y: {
                grace: 5,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartQ3Rating() {
      myChartQ3Rating = new Chart(
        document.getElementById('myChartQ3Rating'),
        {
          type: 'bar',
          data: {
            labels: ['Jul', 'Aug', 'Sep'],
            datasets: [{
              label: 'Very Unsatisfied',
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              data: q3RData[0],
            },
            {
              label: 'Unsatisfied',
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
              ],
              borderWidth: 1,
              data: q3RData[1],
            },
            {
              label: 'Neutral',
              backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1,
              data: q3RData[2],
            },
            {
              label: 'Satisfied',
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 1,
              data: q3RData[3],
            },
            {
              label: 'Very Satisfied',
              backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              data: q3RData[4],
            }]
          },
          options: {
            plugins: {
              title: {
                display: true,
                text: 'Q3 Rating Report'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },
            scales: {
              y: {
                grace: 5,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    function generatemyChartQ4Rating() {
      myChartQ4Rating = new Chart(
        document.getElementById('myChartQ4Rating'),
        {
          type: 'bar',
          data: {
            labels: ['Oct', 'Nov', 'Dec'],
            datasets: [{
              label: 'Very Unsatisfied',
              backgroundColor: [
                'rgba(255, 26, 104, 0.2)',
              ],
              borderColor: [
                'rgba(255, 26, 104, 1)',
              ],
              borderWidth: 1,
              data: q4RData[0],
            },
            {
              label: 'Unsatisfied',
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
              ],
              borderColor: [
                'rgba(54, 162, 235, 1)',
              ],
              borderWidth: 1,
              data: q4RData[1],
            },
            {
              label: 'Neutral',
              backgroundColor: [
                'rgba(75, 192, 192, 0.2)',
              ],
              borderColor: [
                'rgba(75, 192, 192, 1)',
              ],
              borderWidth: 1,
              data: q4RData[2],
            },
            {
              label: 'Satisfied',
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 1,
              data: q4RData[3],
            },
            {
              label: 'Very Satisfied',
              backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
              data: q4RData[4],
            }]
          },
          options: {
            plugins: {
              title: {
                display: true,
                text: 'Q4 Rating Report'
              },
              legend: {
                display: true,
                position: 'right',
              },
              datalabels: {
                formatter: (value, context) => {
                  if (value == 0) {
                    return '';
                  } else {
                    return value;
                  }
                }
              }
            },
            scales: {
              y: {
                grace: 5,
                beginAtZero: true,
                min: 0,
              }
            }
          },
          plugins: [ChartDataLabels]
        }
      );
    }

    $('#carouselExampleIndicators').on('slide.bs.carousel', function () {
      myChartMain.destroy();
      myChartStatus.destroy();
      myChartTicket.destroy();
      generatemyChartMain();
      generatemyChartStatus();
      generatemyChartTicket();
      
      @if(auth()->user()->isAdmin() || auth()->user()->isHOD())
        myChartTechTicket.destroy();
        myChartTechPending.destroy();
        // myChartMonthlyRating.destroy();
        generatemyChartTechTicket();
        generatemyChartTechPending();
        // generatemyChartMonthlyRating();


        @if (ceil(date("n") / 3) >= 1)
          myChartQ1Rating.destroy();
          generatemyChartQ1Rating();
        @endif
        @if (ceil(date("n") / 3) >= 2)
          myChartQ2Rating.destroy();
          generatemyChartQ2Rating();
        @endif
        @if (ceil(date("n") / 3) >= 3)
          myChartQ3Rating.destroy();
          generatemyChartQ3Rating();
        @endif
        @if (ceil(date("n") / 3) >= 4)
          myChartQ4Rating.destroy();
          generatemyChartQ4Rating();
        @endif

      @endif
    })
  </script>
@endpush