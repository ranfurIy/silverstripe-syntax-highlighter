<!doctype html>
<html lang="en-NZ">
    <head>
        <title>$Title</title>
        <%-- This is a Silverstripe comment --%>
    </head>
    <body>
        <h1>$PageTitle</h1>

        <%-- Variable examples --%>
        <p>Welcome $FirstName $LastName!</p>
        <p>User email: $Email</p>
        <p>Complex variable: $User.Profile.Avatar.URL</p>
        <p>Method call: $User.getFullName()</p>

        <%-- Control structures with operators --%>
        <% if $Content || not $HideDetails %>
            <div class="welcome">
                <p>Welcome to our site!</p>
            </div>
        <% end_if %>

        <% if $Articles.Count %>
            <% loop $Articles %>
                <article>
                    <h2>$Title</h2>
                    <p>$Content.Summary(100)</p>
                    <% if $Video %>
                        <video controls>
                            <source src="{$Video.URL}" type="video/mp4">
                            Your browser does not support the video tag.
                        </video>
                    <% else_if $Image %>
                        <img src="{$Image.Fill(200,200).Convert('webp').URL}" alt="<% if $AlternativeText %>{$AlternativeText}<% else %>{$Image.Title.ATT}<% end_if %>">
                    <% end_if %>
                </article>
            <% end_loop %>
        <% end_if %>

        <%-- Include and require --%>
        <% include SiteNavigation %>
        <% require css('themes/mytheme/css/layout.css') %>

        <%-- Caching --%>
        <% cached 'navigation', $LastEdited %>
            <% include SiteNavigation %>
        <% end_cached %>

        <script>
            // JavaScript code here
            console.log('Page loaded');
        </script>

        <style>
            /* CSS styles here */
            body { font-family: Arial, sans-serif; }
        </style>
    </body>
</html>
