// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .

/*
 * Function taken from the Google API example. This function is called by the Google Javascript OAuth module
 * when the user either logs in successfully or cancels their login for some reason.
 */
function GoogleSigninCallback(authResult)
{
    console.log("Google sign in:\n");
    console.log(authResult);

    /* When the button is rendered the callback occurs to check whether or not the user previously authorized
       the app and should be automatically signed in. Ignore error if user is not specified */
    if( authResult['error'] == "immediate_failed" && typeof authResult['id_token'] === 'undefined' )
        return; /* Silently ignore this... it's not an error. There was no user to sign in! */

    if (authResult['access_token'])
    {
        // Successfully authorized
        // Hide the sign-in button now that the user is authorized, for example:
        $('#GoogleSigninButton').fadeOut("slow");
        //document.getElementById('GoogleSigninButton').setAttribute('style', 'display: none');

        $.ajax({
            type: 'GET',
            url: 'https://www.googleapis.com/plus/v1/people/me?access_token=' + authResult['access_token'] + '&key=561632997226673',
            async: false,
            contentType: "application/json",
            dataType: 'json',
            success: function(resp) {
                // Do something now that user is disconnected
                // The response is always undefined.
                console.log("Holy crap it worked:\n");
                console.log(resp);
            },
            error: function(e) {
                console.log("Failed to get the google email:\n");
                console.log(e);
            }
        });
    }
    else if (authResult['error'])
    {
        if( authResult['error'] == 'access_denied' )
        {
            var dialog = $('#GoogleDialog');
            dialog.attr("title", "Google sign in failed");
            dialog.children("p").text("Access to your google account was denied.");

            dialog.dialog({
                modal: true,
                buttons: {
                    OK: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });

            dialog.dialog("open");
        }
        else
        {
            // There was an error.
            // Possible error codes:
            //   "access_denied" - User denied access to your app
            //   "immediate_failed" - Could not automatically log in the user
        }
        alert('There was an error: ' + authResult['error']);
    }
}

function GoogleSignoutAreYouSure()
{
    var dialog = $('#GoogleDialog');
    dialog.attr("title", "Are you sure?");
    dialog.children("p").text("Are you sure that you want to sign out using Google?");

    dialog.dialog({
        modal: true,
        buttons: {
            Yes: function() {
                $( this ).dialog( "close" );
                GoogleDisconnectUser(null);
            },
            No: function() {
                $( this ).dialog( "close" );
            }
        }
    });

    dialog.dialog("open");
}
/*
 * This function is taken from the Google API example. When using Goggle log in we should provide a means for the
 * user to disassociate their account from our website/app. This function does this!
 */
function GoogleDisconnectUser()
{
    var oAuthToken = gapi.auth.getToken();
    var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' + oAuthToken.access_token;

    $.ajax({
        type: 'GET',
        url: revokeUrl,
        async: false,
        contentType: "application/json",
        dataType: 'jsonp',
        success: function(nullResponse) {
            // Do something now that user is disconnected
            // The response is always undefined.
            alert("Signed out ok");
        },
        error: function(e) {
            // Handle the error
            // console.log(e);
            // You could point users to manually disconnect if unsuccessful
            // https://plus.google.com/apps
            alert("Google signout error");
        }
    });
}