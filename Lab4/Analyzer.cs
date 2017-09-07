using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace TLG.Concordance
{
    internal struct Wordref
    {
        internal string word;
        internal int paragraphIndex;
        internal int sentenceIndex;
        internal int wordPositionIndex;
    }

    internal struct Paragraph
    {
        internal string text;
        internal List<Sentence> sentences;
    }

    internal struct Sentence
    {
        internal string text;
        internal List<Wordref> words;
    }

    public class Analyzer
    {
        // Storage for extracted text
        internal List<Paragraph> paragraphs = new List<Paragraph>();
        internal List<Wordref> wordRefs = new List<Wordref>();

        // Put Regex here to avoid multiple instantiations
        // Regex to recognize paragraph breaks
        Regex regParagraphSplit = new Regex(@"(?:\s*\r\n\s*)+");
        // Regex to recognize sentence breaks
        Regex regSentenceSplit = new Regex(@"(?:[\.?!]\s*)");
        // Regex to recogize word breaks
        Regex regWordSplit = new Regex(@"[\s+-]");
        // Regex to find non-word characters
        Regex regPunctuationClean = new Regex(@"\W");
        // Regex to find word characters
        Regex regFindText = new Regex(@"\w");

        public void Analyze(string input)
        {
            SplitParagraphs(input);
        }

        // Find the paragraphs in the input
        void SplitParagraphs(string @in)
        {
            string[] paragraphStrings;

            paragraphStrings = regParagraphSplit.Split(@in);
            foreach (string pgstr in paragraphStrings)
            {
                // Split that matches on last character always adds an empty string as last member in the array
                // ,, is special case to deal with junk in beginning of text
                if ((pgstr != string.Empty) && (pgstr != ",,"))
                {
                    paragraphs.Add(new Paragraph { text = pgstr, sentences = new List<Sentence>()});
                    SplitSentences(paragraphs[paragraphs.Count - 1], paragraphs.Count - 1);
                }
            }
        }

        // Find the sentences in a paragraph
        void SplitSentences(Paragraph pg, int pgindex)
        {
            {
                string[] sentenceStrings;

                sentenceStrings = regSentenceSplit.Split(pg.text);
                foreach (string sent in sentenceStrings)
                {
                    if ((sent != string.Empty) && (regFindText.IsMatch(sent)))
                    {
                        pg.sentences.Add(new Sentence { text = sent, words = new List<Wordref>() });
                        SplitWords(pg.sentences[pg.sentences.Count - 1], pgindex, pg.sentences.Count - 1);
                    }
                }
            }
        }

        // Find the words in each sentence
        void SplitWords(Sentence sent, int pgindex, int sentindex)
        {
            string[] wordStrings = regWordSplit.Split(sent.text);
            int wordIndex = -1;

            foreach (string wd in wordStrings)
            {
                if (wd == string.Empty) { continue; }

                string cleanedWord = regPunctuationClean.Replace(wd, "").ToLower();
                if (cleanedWord.Length == 0) { continue; }
                
                ++wordIndex;

                if (Excluded(cleanedWord.ToString())) { continue; }

                sent.words.Add(new Wordref
                {
                    word = cleanedWord,
                    paragraphIndex = pgindex,
                    sentenceIndex = sentindex,
                    wordPositionIndex = wordIndex
                });
                wordRefs.Add(new Wordref
                {
                    word = cleanedWord,
                    paragraphIndex = pgindex,
                    sentenceIndex = sentindex,
                    wordPositionIndex = wordIndex
                });
            }
        }

        bool Excluded(string inWord)
        {
            bool found = false;
            foreach (string exword in Concordance.excludedWords)
            {
                found = (inWord == exword);
                if (found) { break; }
            }
            return found;
        }

    }
}