# MiniShop Monitoring

## 1. Monitoring Architecture

- Node Exporter collects host-level metrics such as CPU, memory,filesystem, and network metrics.
- cAdvisor collects container-level metrics such as container CPU, memory, network, and filesystem usage.
- Prometheus scrapes metrics from Node Exporter, cAdvisor, and other configured targets and stores them as time-series data.
- Grafana connects to Prometheus and visualizes the metrics using dashboards, graphs, gauges, and stat panels. It can show both current values and historical trends.
- MiniShop is the application and infrastructure we are monitoring.

```
                         MiniShop
                            |
             +--------------+--------------+
             |              |              |
             v              v              v
          Nginx          Backend       PostgreSQL
             |              |              |
             +--------------+--------------+
                            |
                     Runtime Metrics
                            |
                +-----------+-----------+
                |                       |
                v                       v
          cAdvisor               Node Exporter
                |                       |
                +-----------+-----------+
                            |
                            v
                       Prometheus
                            |
                            v
                         Grafana
                            |
                            v
                    Human / Operator
```

## 2. Metrics vs Logs vs Traces

### Metrics

A metric is a measurable value that can be observed over time, such as CPU usage, memory usage, or request latency.

### Logs

A log is a time-stamped snapshot of one event. It might be a plain-text line in a file, a JSON document in object storage, or a structured message on a stream. Logging helps us understand what happened.

### Traces

A trace follows a single request through every part of the system. Each hop records a span with start time, end time, and tags such as SQL text or external URL. All spans share a trace ID, so you can rebuild the entire journey in one view.

## 3. Golden Signals

1. Latency
How long does it take to request?
```
GET /api/orders → 850ms
```
2. Traffic
How many requests do we have?
```
100 requests/sec
```
3. Errors
How many failures do we have?
```
HTTP 500 = 15/min
```
4. Saturation
How full are the resources?
```
CPU = 95%
RAM = 92%
Disk = 88%
```

## 4. Docker Resource Monitoring

### First, without any additional tools

```Bash
sudo docker stats
```
Let it is running for some minutes. Like:
```
CONTAINER       CPU %      MEM USAGE / LIMIT
backend         2.5%       150MiB / 1GiB
postgres        1.2%       220MiB / 2GiB
nginx           0.1%       15MiB / 1GiB
```

### One-time snapshot

Better:
```
sudo docker stats --no-stream
```
This is very useful for incident.

## 5. Prometheus

Prometheus is a monitoring system that collects metrics and stores them in a time-series format.

Simple mental:
```
Exporter / Application
        ↓
      Metrics
        ↓
    Prometheus
        ↓
      Query
        ↓
    Dashboard / Alert
```
#### Pull Model

Prometheus usually scrapes metrics. Like:
```
Prometheus
   |
   | GET /metrics
   v
Exporter
```
This is different from the logging model.

## 6. Node Exporter

Node Exporter exposes Host-level metrics.

Like:
```
CPU
RAM
filesystem
network
load
```

## 7. cAdvisor

cAdvisor exposes container-level metrics.

Like:
```
container CPU
container memory
container filesystem
container network
```

## 8. Grafana

Grafana is for Visualization.
Prometheus collects & stores data. Grafana displays it as a dashboard.

## 9. Health Checks vs Monitoring

This is really important:
```
Healthcheck
→ container/service-level signal

Monitoring
→ observes the system over time
```
Like:
```
Healthcheck = healthy
```
But:
```
Request latency = 8 seconds
```
The system is technically healthy, but the user experience is poor.

## 10. Alerting

Monitoring isn't useful without alerting. Suppose:
```
CPU = 95%
```
If no one opens the dashboard:
```
Nobody knows.
```

Alert can say:
```
CPU usage is too high.
```

### 1. Alert Concepts

Three concepts:
- Metric
- Threshold
- Action

For example:
```
CPU > 80%
```
For:
```
5 minutes
```
-> Alert.

### 2. Good Alert vs Bad Alert

Bad:
```
CPU > 50%
```
For always. It may creates a lot of noises.

Good alert should be:
```
Actionable
Relevant
Stable
```

### 3. Example alerts

Design these today:

Alert 1
```
Host disk usage > 80%
```

Alert 2
```
Backend container memory > 80% of configured limit
```

Alert 3
```
Backend health is failing
```

Alert 4
```
HTTP 5xx rate is unusually high
```

## 11. Troubleshooting

```
                Incident
                   ↓
              Observation
                   ↓
              Metrics + Logs
                   ↓
                Trend
                   ↓
              Hypothesis
                   ↓
                Evidence
                   ↓
              Root Cause
                   ↓
               Recovery
                   ↓
              Prevention

```

## 12. Production Considerations

```
Node Exporter
    ↓
Exporter
    ↓
"Expose metrics"

cAdvisor
    ↓
Exporter
    ↓
"Expose metrics"

Prometheus
    ↓
Monitoring system / TSDB
    ↓
"Scrape + Store + Query"

Grafana
    ↓
Visualization / Dashboard
    ↓
"Show + Analyze"
```
