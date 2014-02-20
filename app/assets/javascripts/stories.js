	// Initialize the CKEditor for the rich text body.
if ($("#story_body").length) {
	CKEDITOR.replace( 'story_body',  {
		toolbar: [
			[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ], ['Link', 'Unlink'], [ 'Source'],
			'/',
			[ 'Bold', 'Italic', 'RemoveFormat'], ['JustifyLeft', 'JustifyCenter', 'JustifyRight'], [ 'NumberedList','BulletedList'], ['Outdent', 'Indent'], ['Maximize']
			], // end toolbar
			width: 'auto',
			height: '320px'
	}); // end cke replace
}