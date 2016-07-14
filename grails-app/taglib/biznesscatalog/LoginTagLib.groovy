package biznesscatalog

class LoginTagLib {
	def loginControl = {
		if(session.user){
			def userID = session.user.id
			if(session.currentUserRole.toString() == 'Administrator') {
				//out <<  """${g.link(action:"show", id="${session.user.id}"){"${session.user.fullName}"}}"""
				out << "${session.user.fullName} "
				out << """[${link(action:"logout", controller:"user"){"Изход"}}] """
				out << """| ${link(action:"list", controller:"category"){"Категории"}} """
				out << """| ${link(action:"list", controller:"user"){"Потребители"}}"""
			}else {
				out << "${session.user.fullName} "
				out << """[${link(action:"logout", controller:"user"){"Изход"}}] """
				out << """| ${link(action:"create", controller:"company"){"Създай компания"}}"""
			}
		} else {
			out << """${link(action:"login", controller:"user"){"Вход"}} """
			out << """| ${link(action:"create", controller:"user"){"Регистрация"}} """
		}
	}
}
