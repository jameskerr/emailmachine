// ############# EVERYTHING THAT NEEDS TO BE HIDDEN ################
$("div.action-menu").hide();


// ########### MAKING THINGS SORTABLE (DRAG & DROP) ################
$("#stories-table tbody").sortable({
			update: function(event, ui) {
				var ids = $(this).sortable('toArray');
				var load = {stories: ids};
				$.ajax({
					type: 'post',
					data: load,
					url: '/stories/sort'
				});// end Ajax
			}, // end update
			handle: ".drag-handle",
			placeholder: "sortable-placeholder",
			cursor: "move"
	}); // end Story Sortable Options
	
$("#jobs-list").sortable({
	update: function(event, ui) {
		var ids = $(this).sortable('toArray');
		var load = {jobs: ids};
		$.ajax({
			type: 'post',
			data: load,
			url: '/jobs/sort'
		}); // end ajax
	}// end update
}); // end Job Sortable options

$("#publics-list").sortable({
	update: function(event, ui) {
		var ids = $(this).sortable('toArray');
		var load = {publics: ids};
		$.ajax({
			type: 'post',
			data: load,
			url: '/publics/sort'
		}); // end ajax
	}// end update
}); // end Job Sortable options


// ########### MOUSEOVERS TO SHOW THE MENUS ###############
$("#stories-table tr").mouseover(
	function() { $(".action-menu",this).show(); }
).mouseout(
	function() { $(".action-menu",this).hide(); }
); // end mouseovers

$(".sort-list li").mouseover(
	function() { $(".action-menu",this).show(); }
).mouseout(
	function() { $(".action-menu",this).hide(); }
); // end mouseovers

$("td.right-rail h2").mouseover(
	function() { $(".action",this).show(); }
).mouseout(
	function() { $(".action",this).hide(); }
); // end mouseovers