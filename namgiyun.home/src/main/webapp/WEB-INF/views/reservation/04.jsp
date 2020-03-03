<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='res/calender/core/main.css' rel='stylesheet' />
<link href='res/calender/daygrid/main.css' rel='stylesheet' />
<link href='res/calender/timegrid/main.css' rel='stylesheet' />
<script src='res/calender/core/main.js'></script>
<script src='res/calender/interaction/main.js'></script>
<script src='res/calender/daygrid/main.js'></script>
<script src='res/calender/timegrid/main.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
var events = [];
var eventss = new Array();
var date = new Date();
var date_y = date.getFullYear();
var date_m = date.getMonth() + 1;
var date_d = date.getDate();
var defa = date_y +'-'+ date_m +'-' + date_d;
console.log(defa);

  document.addEventListener('DOMContentLoaded', function() {   
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      timeZone: 'local',
      plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      locale: 'ko',
      defaultDate: defa,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      
      editable: true,
      eventLimit: true, // allow "more" link when too many events
    });
    
 calendar.batchRendering(function() {
	  calendar.changeView('dayGridMonth');
	  $.ajax({
			method:"post",
			url:"calender.do",			
			data: {},
			success: function(result){		
				if(result != null){
					$(result).each(function(idx,num) {
						var checkout = result[idx].resvChekOut;
						var date = new Date(checkout);

						calendar.addEvent({ 
							 title: result[idx].resvName + ', ' + result[idx].resvPhone, 
							 start: result[idx].resvCheckIn, 
							 end:  date			 
						 });
						console.log(result[idx].resvCheckIn);
						console.log(result[idx].resvChekOut);
					})
				}		
				calendar.render();
			},
			error: function(a, b, errMsg){
				alert(errMsg);
			}
		});
	});
    calendar.render();

  });
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>
