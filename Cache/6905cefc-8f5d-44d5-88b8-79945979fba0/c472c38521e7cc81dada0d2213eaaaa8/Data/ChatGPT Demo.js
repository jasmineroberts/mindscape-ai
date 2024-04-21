// @input Component.Text question
// @input Component.Text answer
// @input SceneObject question_obj
// @input SceneObject hint
// @input SceneObject main

function requestGPT() {
    const request = { 
        "temperature": 1,
        "messages": [
            {"role": "user", "content": script.question.text}
        ]
    };
    
    global.chatGpt.completions(request, (errorStatus, response) => {
        if (!errorStatus && typeof response === 'object') {
            const mainAnswer = response.choices[0].message.content;
            
            // script.question_obj.enabled = false;
            script.answer.text = mainAnswer;
            print(mainAnswer);
        } else {
            print(JSON.stringify(response));
        }
    })
}

script.createEvent("TapEvent").bind(start);

// global.behaviorSystem.addCustomTriggerResponse(
//   "start",
//   start
// );


// onEditingFinished

var isAsked = false;
var inputStarted = false;
var boxReady = false;

var onTapEvent = script.question.onEditingUpdated.add(function(tapEventArgs){
    if(!inputStarted) {
        inputStarted = true;
        script.hint.enabled = false;
    }
});

var onTapEvent = script.question.onEditingFinished.add(function(tapEventArgs){
    if(!isAsked) {
        requestGPT();
        script.question_obj.enabled = false;
        global.tweenManager.startTween(script.main, "box_in", (function () {
                    print("fff");
                })); 
        }
        isAsked = true;
    }
});


function start() {
    // script.question.text = ""
    // if(script.question.text != "Click on this text to change it to your question") requestGPT();
}