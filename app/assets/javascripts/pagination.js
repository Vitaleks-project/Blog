$(function() {
    $(".pagination-posts a").on("click", function() {
        $(".pagination-posts").html("Page is loading...");
        $.getScript(this.href);
        return false;
    });
});