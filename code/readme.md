# Code te gebruiken bij workshop

## charts

### live chart

```
var msgtemp = { topic: "temperature", payload: msg.payload.temperature }
var msghum = { topic: "humidity", payload: msg.payload.humidity }

return [[msgtemp, msghum]];
```

### chart uit mysql

#### select
```
msg.payload = [msg.payload.deviceid];
msg.topic = "SELECT * FROM TemperatureHumidity WHERE deviceid = ? ORDER BY id DESC LIMIT 50;"
return msg;
```

#### format
```
(
  $series := [
    { "field": "temperature1", "label": "temp" },
    { "field": "humidity", "label": "humidity" }
  ];
  $xaxis := "time";
  [
    {
      "series": $series.label,
      "data": $series.[
        (
          $yaxis := $.field;
          $$.payload.{
            "x": $lookup($, $xaxis),
            "y": $lookup($, $yaxis)
          }
        )
      ]
    }
  ]
)
```

## mysql

### insert uit form

```
msg.payload = [new Date(msg.payload.datetime), msg.payload.deviceid, msg.payload.temperature, msg.payload.humidity];
msg.topic = "INSERT INTO TemperatureHumidity (time,deviceid,temperature1,humidity) VALUES (?,?,?,?);"
return msg;
```

### select uit http

```
msg.payload = [msg.payload.deviceid];
msg.topic = "SELECT time,temperature1 FROM TemperatureHumidity WHERE deviceid = ?;"
return msg;
```

### select uit form
```
msg.payload = [msg.payload.deviceid];
msg.topic = "SELECT * FROM TemperatureHumidity WHERE deviceid = ? ORDER BY id DESC LIMIT 50;"
return msg;
```
