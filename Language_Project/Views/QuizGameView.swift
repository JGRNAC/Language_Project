//
//  QuizGameView.swift
//  Vocabzilla
//
//  Created by Jan Grnac on 03/08/2025.
//

import SwiftUI

struct QuizGameView: View {
    @EnvironmentObject var vocabularyViewModel: VocabularyViewModel

    @State private var currentQuestion: VocabularyModel?
    @State private var answerOptions: [String] = []
    @State private var correctAnswer: String = ""
    @State private var showResult = false
    @State private var isCorrect = false

    @State private var score = 0
    @State private var questionCount = 0
    @State private var showSummary = false
    @State private var selectedLanguage: String = "All"

    private let totalQuestions = 10

    var filteredItems: [VocabularyModel] {
        if selectedLanguage == "All" {
            return vocabularyViewModel.items
        } else {
            return vocabularyViewModel.items.filter { $0.language == selectedLanguage }
        }
    }

    var uniqueLanguages: [String] {
        let langs = Set(vocabularyViewModel.items.map { $0.language })
        return ["All"] + langs.sorted()
    }

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.5), Color(UIColor.systemBackground)]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                if showSummary {
                    VStack(spacing: 16) {
                        Text("Quiz Complete")
                            .font(.largeTitle).bold()
                        Text("Your Score: \(score)/\(totalQuestions)")
                            .font(.title2)
                        Button("Play Again") {
                            resetQuiz()
                        }
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                } else {
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(uniqueLanguages, id: \ .self) { lang in
                            Text(lang).tag(lang)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)

                    ProgressView(value: Double(questionCount), total: Double(totalQuestions))
                        .padding(.horizontal)

                    Text("What does this word mean?")
                        .font(.title2)
                        .bold()

                    if let question = currentQuestion {
                        Text(question.word)
                            .font(.largeTitle)
                            .padding()

                        ForEach(answerOptions, id: \.self) { option in
                            Button(action: {
                                checkAnswer(selected: option)
                            }) {
                                Text(option)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                            }
                        }

                        if showResult {
                            Text(isCorrect ? "✅ Correct!" : "❌ Wrong")
                                .font(.headline)
                                .foregroundColor(isCorrect ? .green : .red)
                                .padding()

                            Button("Next") {
                                loadNewQuestion()
                            }
                            .padding(.top, 10)
                        }
                    } else {
                        Text("Not enough words to start a quiz.")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            loadNewQuestion()
        }
    }

    func loadNewQuestion() {
        let vocab = filteredItems.shuffled()

        guard vocab.count >= 4 else {
            currentQuestion = nil
            return
        }

        if questionCount >= totalQuestions {
            showSummary = true
            return
        }

        currentQuestion = vocab[0]
        correctAnswer = vocab[0].translation

        var options = [correctAnswer]
        var usedIndices: Set<Int> = [0]

        while options.count < 4 && usedIndices.count < vocab.count {
            let index = Int.random(in: 1..<vocab.count)
            if !usedIndices.contains(index) {
                options.append(vocab[index].translation)
                usedIndices.insert(index)
            }
        }

        answerOptions = options.shuffled()
        showResult = false
    }

    func checkAnswer(selected: String) {
        isCorrect = (selected == correctAnswer)
        showResult = true
        if isCorrect { score += 1 }
        questionCount += 1
    }

    func resetQuiz() {
        score = 0
        questionCount = 0
        showSummary = false
        loadNewQuestion()
    }
}

#Preview {
    QuizGameView()
        .environmentObject(VocabularyViewModel())
}
