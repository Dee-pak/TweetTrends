<!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
    <title>Contact Us</title>
  </head>
  <body>
    <h3>Northeastern University</h3>
    <div id="map"></div>
    <script>
      function initMap() {
        var uluru = {lat: 42.3398067, lng: -71.0913604};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwaQxUBv8pI7-zSCt9ExXRSDUfSO_YPDk&callback=initMap">
    </script>
    <div class="span4">
        <h2>Tweets & Trends</h2>
        <address>
          <strong>Northeastern University</strong><br>
          360 Huntington Avenue<br>
          Boston, MA<br>
          USA<br>
          <abbr title="Phone">P:</abbr> 617-893-5747
        </address>
      </div>
  </body>
</html>