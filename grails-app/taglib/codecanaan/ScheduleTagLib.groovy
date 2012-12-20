package codecanaan

class ScheduleTagLib {

	static namespace = "schedule"

	def scheduleService

	def answerAvailable = { attrs, body ->

		if (attrs.test && scheduleService.answerAvailable(attrs.test)) {
			out << body()
		}
	}
}
