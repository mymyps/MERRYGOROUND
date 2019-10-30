
!function($) {
    "use strict";

    var defaultEvents = [];
    // 실행시 데이터를 받아옴
    defaultEvents = testAr;
    
    var CalendarApp = function() {
        this.$body = $("body")
        this.$modal = $('#event-modal'),
        this.$event = ('#external-events div.external-event'),
        this.$calendar = $('#calendar'),
        this.$saveCategoryBtn = $('.save-category'),
        this.$categoryForm = $('#add-category form'),
        this.$extEvents = $('#external-events'),
        this.$calendarObj = null
    };


    /* on drop */
    CalendarApp.prototype.onDrop = function (eventObj, date) { 
        var $this = this;
            // retrieve the dropped element's stored Event Object
            var originalEventObject = eventObj.data('eventObject');
            var $categoryClass = eventObj.attr('data-class');
            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);
            // assign it the date that was reported
            copiedEventObject.start = date;
            if ($categoryClass)
                copiedEventObject['className'] = [$categoryClass];
            // render the event on the calendar
            $this.$calendar.fullCalendar('renderEvent', copiedEventObject, true);
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                eventObj.remove();
            }
    },
    /* on click on event */
    CalendarApp.prototype.onEventClick =  function (calEvent, jsEvent, view) {
        var $this = this;
            var form = $("<form></form>");
            form.append("<label>event 변경 내용</label>");
            form.append("<div class='input-group'><input class='form-control' type=text value='" + calEvent.title + "' /><span class='input-group-btn'><button type='submit' class='btn btn-success waves-effect waves-light'><i class='fa fa-check'></i> 저장</button></span></div>");
            $this.$modal.modal({
                backdrop: 'static'
            });
            $this.$modal.find('.delete-event').show().end().find('.save-event').hide().end().find('.modal-body').empty().prepend(form).end().find('.delete-event').unbind('click').click(function () {
            	// 이벤트 삭제
//            	console.log("remove event ->");
            	var calTmp = {
	        		title: calEvent.title,
	        		start: typeof calEvent.start._i === "number"? calEvent.start._i:calEvent.start._i.getTime(),
	        		end: typeof calEvent.end._i === "number" ? calEvent.end._i:calEvent.end != null?calEvent.end._i.getTime():"null",
//    				end: typeof calEvent.end._i === "number" ? calEvent.end._i:calEvent.end != null?calEvent.end._i.getTime():"null",
	        		className: calEvent.className[0]
	        	};
	        	
	        	$(document).ready(function(){
	        		 $.ajax({
						url: ajaxPath + '/admin/calDel.do',
						data: calTmp,
						success: function (data) {
							console.log("일정을 삭제했습니다");
							$this.$calendarObj.fullCalendar('removeEvents', function (ev) {
			                	return (ev._id == calEvent._id);
			                });
						},
	                    error : function(e) {
	                    	console.log("calendar ajax error");
	                    }
					});
	    		});
            	
                $this.$modal.modal('hide');
            });
            $this.$modal.find('form').on('submit', function () {
            	// 이벤트 수정
            	calEvent.title = form.find("input[type=text]").val();
            	
//            	console.log("mod event ->");
            	
            	var calTmp = {
	        		title: calEvent.title,
	        		start: typeof calEvent.start._i === "number" ? calEvent.start._i:calEvent.start._i.getTime(),
    				end: typeof calEvent.end._i === "number" ? calEvent.end._i:calEvent.end != null?calEvent.end._i.getTime():"null",
	        		className: calEvent.className[0]
	        	};
	        	
	        	$(document).ready(function(){
	        		 $.ajax({
						url: ajaxPath + '/admin/calMod.do',
						data: calTmp,
						success: function (data) {
							console.log("일정을 수정했습니다");
							$this.$calendarObj.fullCalendar('updateEvent', calEvent);
						},
	                    error : function(e) {
	                    	console.log("calendar ajax error");
	                    }
					});
	    		});
                
                $this.$modal.modal('hide');
                return false;
            });
    },
    /* on select */
    CalendarApp.prototype.onSelect = function (start, end, allDay) {
        var $this = this;
            $this.$modal.modal({
                backdrop: 'static'
            });
            var form = $("<form></form>");
            form.append("<div class='row'></div>");
            form.find(".row")
                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>이벤트 제목</label><input class='form-control' placeholder='이벤트 이름입력' type='text' name='title'/></div></div>")
                .append("<div class='col-md-6'><div class='form-group'><label class='control-label'>카테고리</label><select class='form-control' name='category'></select></div></div>")
                .find("select[name='category']")
                .append("<option value='bg-danger'>빨강</option>")
                .append("<option value='bg-success'>녹색</option>")
                .append("<option value='bg-dark'>검정</option>")
                .append("<option value='bg-primary'>파랑</option>")
                .append("<option value='bg-pink'>핑크</option>")
                .append("<option value='bg-info'>청색</option>")
                .append("<option value='bg-warning'>노랑</option></div></div>");
            $this.$modal.find('.delete-event').hide().end().find('.save-event').show().end().find('.modal-body').empty().prepend(form).end().find('.save-event').unbind('click').click(function () {
                form.submit();
            });
            $this.$modal.find('form').on('submit', function () {
                var title = form.find("input[name='title']").val();
                var beginning = form.find("input[name='beginning']").val();
                var ending = form.find("input[name='ending']").val();
                var categoryClass = form.find("select[name='category'] option:checked").val();
                if (title !== null && title.length != 0) {
                	
//                	console.log("----------");
//                    console.log(title); //String
//                    console.log(start); //number
//                    console.log(end);
//                    console.log(categoryClass); //String
//                    console.log($.now());
//                	console.log($.now(new Date(end._i)));
                	var ddd = new Date(end._i) - new Date(end._i).getDate();
                	ddd = new Date(ddd);
//                    console.log("----------");
                	// ajax 통신으로 데이터 저장
                	var calTmp = {
                		title: title,
                		start: start._i,
                		end: new Date(ddd).getTime(),
                		className: categoryClass
                	};
//                	console.log(calTmp);
                	
                	$(document).ready(function(){
                		 $.ajax({
     						url: ajaxPath + '/admin/calSave.do',
     						data: calTmp,
     						success: function (data) {
     							console.log("일정을 저장했습니다");
     							defaultEvents.push({
     		                		title: title,
     		            			start: new Date($.now()),
     		            			end: new Date($.now()),
     		            			className: categoryClass
     		                    });
     							$this.$calendarObj.fullCalendar('renderEvent', {
     		                        title: title,
     		                        start:start,
     		                        end: end,
     		                        allDay: false,
     		                        className: categoryClass
     		                    }, true);  
     							
     						},
     	                    error : function(e) {
//     	                        console.log(e.responseText);
     	                    	console.log("calendar ajax error");
     	                    }
     					});
            		});
                    $this.$modal.modal('hide');

                }
                else{
                    alert('타이틀을 입력해야합니다');
                }
                return false;
                
            });
            $this.$calendarObj.fullCalendar('unselect');
    },
    CalendarApp.prototype.enableDrag = function() {
        //init events
        $(this.$event).each(function () {
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
        	
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };
            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);
            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });
        });
    }
    /* Initializing */
    CalendarApp.prototype.init = function() {
        this.enableDrag();
        /*  Initialize the calendar  */
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var form = '';
        //var today = new Date($.now()); //전역변수로 선언

//        defaultEvents =  [{
//                title: '이야!',
//                start: new Date($.now() + 158000000),
//                className: 'bg-dark'
//            }, {
//                title: '이존데',
//                start: today,
//                end: today,
//                className: 'bg-danger'
//            }, {
//                title: '테마구입',
//                start: new Date($.now() + 338000000),
//                className: 'bg-primary'
//            }
//            
//            ];
//        console.log("############");
//        console.log(defaultEvents);
        
        var $this = this;
        $this.$calendarObj = $this.$calendar.fullCalendar({
            slotDuration: '00:15:00', /* If we want to split day time each 15minutes */
            minTime: '08:00:00',
            maxTime: '19:00:00',  
            defaultView: 'month',  
            handleWindowResize: true,   
            height: $(window).height() - 200,   
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: defaultEvents,
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            eventLimit: true, // allow "more" link when too many events
            selectable: true,
            drop: function(date) { $this.onDrop($(this), date); },
            select: function (start, end, allDay) { $this.onSelect(start, end, allDay); },
            eventClick: function(calEvent, jsEvent, view) { $this.onEventClick(calEvent, jsEvent, view); }

        });

        //on new event
        this.$saveCategoryBtn.on('click', function(){
            var categoryName = $this.$categoryForm.find("input[name='category-name']").val();
            var categoryColor = $this.$categoryForm.find("select[name='category-color']").val();
            if (categoryName !== null && categoryName.length != 0) {
                $this.$extEvents.append('<div class="external-event bg-' + categoryColor + '" data-class="bg-' + categoryColor + '" style="position: relative;"><i class="fa fa-move"></i>' + categoryName + '</div>')
                $this.enableDrag();
            }

        });
    },

   //init CalendarApp
    $.CalendarApp = new CalendarApp, $.CalendarApp.Constructor = CalendarApp
    
}(window.jQuery),

//initializing CalendarApp
function($) {
    "use strict";
    $.CalendarApp.init()
}(window.jQuery);
