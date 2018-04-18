$(document).ready ->
	App.alert = App.cable.subscriptions.create('MaintenanceDeviceChannel',
		connected: ->
			# Called when the subscription is ready for use on the server
			return
		disconnected: ->
			# Called when the subscription has been terminated by the server
			return
		received: (data) ->
			console.log data
			tr = $("#" + data["apiotics_instance"])
			td = tr.children("." + data["worker_name"] + "-" + data["model_name"] + "-" + data["interface"])
			td.text(data["value"])
			electricity = tr.children(".maintenance_device-electricity_sensor-current")
			magnet = tr.children(".maintenance_device-magnetic_field_sensor-active")
			vibration = tr.children(".maintenance_device-vibration_sensor-threshold_exceeded")
			if parseInt( electricity.text(), 10) > 2 or magnet.text() == "true" or vibration.text() == "true"
				tr.css("background-color", "#ff0000")	
			else
				tr.css("background-color", "#ffffff")
			# Called when there's incoming data on the websocket for this channel
			return
	)