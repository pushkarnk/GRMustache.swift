import XCTest

extension ConfigurationContentTypeTests {

   static var allTests : [(String, (ConfigurationContentTypeTests) -> () throws -> Void)] {
      return [
                ("testFactoryConfigurationHasHTMLContentTypeRegardlessOfDefaultConfiguration", testFactoryConfigurationHasHTMLContentTypeRegardlessOfDefaultConfiguration),
                ("testDefaultConfigurationContentTypeHTMLHasTemplateRenderEscapedInput", testDefaultConfigurationContentTypeHTMLHasTemplateRenderEscapedInput),
                ("testDefaultConfigurationContentTypeTextLHasTemplateRenderUnescapedInput", testDefaultConfigurationContentTypeTextLHasTemplateRenderUnescapedInput),
                ("testDefaultConfigurationContentTypeHTMLHasTemplateRenderHTML", testDefaultConfigurationContentTypeHTMLHasTemplateRenderHTML),
                ("testDefaultConfigurationContentTypeTextHasTemplateRenderText", testDefaultConfigurationContentTypeTextHasTemplateRenderText),
                ("testDefaultConfigurationContentTypeHTMLHasSectionTagRenderHTML", testDefaultConfigurationContentTypeHTMLHasSectionTagRenderHTML),
                ("testDefaultConfigurationContentTypeTextHasSectionTagRenderText", testDefaultConfigurationContentTypeTextHasSectionTagRenderText),
                ("testDefaultConfigurationContentTypeHTMLHasVariableTagRenderHTML", testDefaultConfigurationContentTypeHTMLHasVariableTagRenderHTML),
                ("testDefaultConfigurationContentTypeTextHasVariableTagRenderText", testDefaultConfigurationContentTypeTextHasVariableTagRenderText),
                ("testPragmaContentTypeTextOverridesDefaultConfiguration", testPragmaContentTypeTextOverridesDefaultConfiguration),
                ("testPragmaContentTypeHTMLOverridesDefaultConfiguration", testPragmaContentTypeHTMLOverridesDefaultConfiguration),
                ("testDefaultRepositoryConfigurationHasDefaultConfigurationContentType", testDefaultRepositoryConfigurationHasDefaultConfigurationContentType),
                ("testRepositoryConfigurationContentTypeHTMLHasTemplateRenderEscapedInputWhenSettingTheWholeConfiguration", testRepositoryConfigurationContentTypeHTMLHasTemplateRenderEscapedInputWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationContentTypeHTMLHasTemplateRenderEscapedInputWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationContentTypeHTMLHasTemplateRenderEscapedInputWhenUpdatingRepositoryConfiguration),
                ("testRepositoryConfigurationContentTypeTextHasTemplateRenderUnescapedInputWhenSettingTheWholeConfiguration", testRepositoryConfigurationContentTypeTextHasTemplateRenderUnescapedInputWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationContentTypeTextHasTemplateRenderUnescapedInputWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationContentTypeTextHasTemplateRenderUnescapedInputWhenUpdatingRepositoryConfiguration),
                ("testRepositoryConfigurationContentTypeTextOverridesDefaultConfigurationContentTypeHTMLWhenSettingTheWholeConfiguration", testRepositoryConfigurationContentTypeTextOverridesDefaultConfigurationContentTypeHTMLWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationContentTypeTextOverridesDefaultConfigurationContentTypeHTMLWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationContentTypeTextOverridesDefaultConfigurationContentTypeHTMLWhenUpdatingRepositoryConfiguration),
                ("testRepositoryConfigurationContentTypeHTMLOverridesDefaultConfigurationContentTypeTextWhenSettingTheWholeConfiguration", testRepositoryConfigurationContentTypeHTMLOverridesDefaultConfigurationContentTypeTextWhenSettingTheWholeConfiguration),
                ("testRepositoryConfigurationContentTypeHTMLOverridesDefaultConfigurationContentTypeTextWhenUpdatingRepositoryConfiguration", testRepositoryConfigurationContentTypeHTMLOverridesDefaultConfigurationContentTypeTextWhenUpdatingRepositoryConfiguration),
                ("testPragmaContentTypeTextOverridesRepositoryConfigurationContentTypeHTMLWhenSettingTheWholeConfiguration", testPragmaContentTypeTextOverridesRepositoryConfigurationContentTypeHTMLWhenSettingTheWholeConfiguration),
                ("testPragmaContentTypeTextOverridesRepositoryConfigurationContentTypeHTMLWhenUpdatingRepositoryConfiguration", testPragmaContentTypeTextOverridesRepositoryConfigurationContentTypeHTMLWhenUpdatingRepositoryConfiguration),
                ("testPragmaContentTypeHTMLOverridesRepositoryConfigurationContentTypeTextWhenSettingTheWholeConfiguration", testPragmaContentTypeHTMLOverridesRepositoryConfigurationContentTypeTextWhenSettingTheWholeConfiguration),
                ("testPragmaContentTypeHTMLOverridesRepositoryConfigurationContentTypeTextWhenUpdatingRepositoryConfiguration", testPragmaContentTypeHTMLOverridesRepositoryConfigurationContentTypeTextWhenUpdatingRepositoryConfiguration),
                ("testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testDefaultConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
                ("testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled", testRepositoryConfigurationMutationHasNoEffectAfterAnyTemplateHasBeenCompiled),
           ]
   }
}

