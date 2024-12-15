{{/*
Expand the name of the chart.
*/}}
{{- define "kubevirt.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kubevirt.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kubevirt.labels" -}}
helm.sh/chart: {{ include "kubevirt.chart" . }}
{{ include "kubevirt.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kubevirt.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kubevirt.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
