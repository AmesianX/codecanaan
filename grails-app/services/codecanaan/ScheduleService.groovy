package codecanaan

class ScheduleService {

    def hasUser(Schedule schedule, User user) {
    	return UserSchedule.countByScheduleAndUser(schedule, user) > 0
    }

    def answerAvailable(ScheduleLesson link) {
    	def today = new Date()
    	return today >= link.begin && today <= link.end && today >= link.deadline
    }
}
