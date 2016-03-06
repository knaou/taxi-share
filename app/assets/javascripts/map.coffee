
class this.GMap
  constructor: (canvas) ->
    if typeof(navigator.geolocation) != 'undefined'
      navigator.geolocation.watchPosition( (position)->
        lat = position.coords.latitude
        lng = position.coords.longitude
        latlng = new google.maps.LatLng(lat, lng)
        myOptions = {
          zoom: 16,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        googlemap = new google.maps.Map(canvas.get()[0], myOptions)
        marker = new google.maps.Marker({
          position: latlng,
          map: googlemap
        })
      , (e) ->
        alert("エラーが発生しました - " + e.message);
      )
