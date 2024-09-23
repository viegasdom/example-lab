resource "quiz" "introduction" {
	questions = [
		resource.multiple_choice_question.terraform_workflow,
	]

	// attempts = 3
	show_hints = true
}

resource "multiple_choice_question" "terraform_workflow" {
	question = "Which stages does the core Terraform workflow consist of?"
	answer = ["write", "plan", "apply"]
	distractors = ["deploy", "email"]

	hints = [
		"First you need to ... the configuration",
		"Then you need to ... the changes",
		"Finally you ... them"
	]
}

resource "quiz" "installation" {
	questions = [
		resource.short_answer_question.capital_france, 
    resource.multiple_choice_question.cities_france,
    resource.multiple_choice_question.question_script,
    resource.short_answer_question.answer_script,
		resource.short_answer_question.javascript_timer
	]
	show_hints = true
	show_answers = true
	attempts = 3
}

resource "short_answer_question" "capital_france" {
	question = "What is the capital of France?"
	answer ="Paris"
	hints = [
    "They host the olympics in 2024",
		"The city is known for the Eiffel Tower"
	]
}

// resource "quiz_question_library" "questions" {
// 	title = "Exam questions"
// 	description = "These are the exam questions"

// 	questions = [
// 		resource.quiz_question.cities_france,
//     resource.quiz_question.javascript_timer
// 	]
	
// 	tags = ["hashicorp", "vault", "dynamic-secrets"]
// }

resource "multiple_choice_question" "cities_france" {
	question = "Which of these cities are in France?"
	answer = ["Paris", "Lyon", "Nantes"]
	distractors = ["London", "Berlin"]
	
	hints = [
		"One of these cities is in the UK",
		"Another city is in Germany"
	]
}

resource "short_answer_question" "javascript_timer" {
	question = "Which javascript function can you use to execute something at an interval?"
	answer = "setInterval"
	exact = true
	
	tags = ["javascript", "coding"]
}

// resource "quiz" "library_exam" {
// 	question_library = resource.quiz_question_library.questions
// 	question_count = 2
	
// 	show_hints = true
// }

resource "short_answer_question" "answer_script" {
  question = "How many pods are running in the default namespace?"

  answer_script {
    answer = <<-EOF
    kubectl get pods -n default | wc -l
    EOF

		config {
	    target = resource.container.vault
	    timeout = 30
	    user = "root"
	    working_directory = "/"
    }
  }

  hints = ["Did you try running kubectl get pods?"]
}

resource "multiple_choice_question" "question_script" {
	question = "Which of these pods are running in the default namespace?"
 
  question_script {
    answer = <<-EOF
    kubectl get pods -n default -o json | jq -r '.items[] | map(.name)'
    EOF
  }
  
  distractors = ["fakepod1", "fakepod2", "fakepod3"]
}