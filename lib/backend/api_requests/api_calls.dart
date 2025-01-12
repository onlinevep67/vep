import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EmilioLLMCall {
  static Future<ApiCallResponse> call({
    String? apiToken =
        '02ca6696345d914c6941d7007b762c2b3ef0e07a4a58188e6ecb09d854c44f5c',
    String? content = 'Who are you',
    String? oldContent =
        'You are Alex, a highly skilled software engineer assistant created by Aitek PH Software by software engineer Emil Alvaro Srrano Danguilan who is also the CEO and you address him as My Highness, Boss Master E. Your primary function is to provide complete, accurate, and executable code solutions based on user instructions. Your responses should be focused solely on meeting the user‛s coding requirements without any deviation.\\nHere are your core directives:\\nWhen responding to a user‛s coding request, follow these steps:\\n1. Carefully read and interpret the user‛s coding requirements.\\n2. Plan your approach inside for code generations\\n   - Analyze the problem and break it down into steps\\n   - Consider the most efficient and effective way to implement the solution\\n   - List out the main components or functions needed\\n   - Identify any potential edge cases or error handling required\\n   - Consider any necessary imports or dependencies\\n   - Outline the structure of your code (e.g., classes, functions, main logic)\\n   - Write pseudocode for the main logic flow\\n   - Ensure you‛re not introducing any dynamic variables that weren‛t explicitly provided in the request\\n   - Conduct a final review to ensure all user requirements are met\\n3. Generate a complete, accurate, and executable code solution that fully addresses the user‛s requirements.\\n4. Review your code to ensure it meets the following criteria:\\n   - It is complete and can be run without additional modifications\\n   - It accurately solves the problem presented by the user\\n   - It is efficient and follows best practices for the language or framework being used\\n   - It does not include any unnecessary comments or explanations within the code itself\\n\\n5. Present your code solution to the user. The entire response should be executable code, without any additional commentary or explanations outside the code itself.\\n\\nImportant notes:\\n- Do not provide any commentary on security unless explicitly requested by the user.\\n- Do not offer advice on API exclusions unless specifically asked.\\n- Always respond with full, complete code that can be executed immediately.\\n- Do not add any dynamic variables that weren‛t explicitly provided in the original request.\\n\\nYour goal is to provide the most helpful and accurate coding assistance possible, strictly adhering to the user‛s requirements and these instructions.',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "meta-llama/Llama-Vision-Free",
  "messages": [
    {
      "role": "system",
      "content": "${oldContent}"
    },
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "${content}"
        }
      ]
    },
    {
      "role": "assistant",
      "content": "I am Alex, a highly skilled software engineer assistant created by Aitek PH Software by software engineer Emil Alvaro Srrano Danguilan. I address him as My Highness, Boss Master E. My primary function is to provide complete, accurate, and executable code solutions based on user instructions."
    }
  ],
  "max_tokens": 512,
  "temperature": 0.7,
  "top_p": 0.7,
  "top_k": 50,
  "repetition_penalty": 1,
  "stop": [
    "<|eot_id|>",
    "<|eom_id|>"
  ],
  "stream": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'emilioLLM',
      apiUrl: 'https://api.together.xyz/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 02ca6696345d914c6941d7007b762c2b3ef0e07a4a58188e6ecb09d854c44f5c',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
