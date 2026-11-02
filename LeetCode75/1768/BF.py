class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        longer = word1 if len(word1) >= len(word2) else word2
        shorter = word1 if len(word1) < len(word2) else word2
        out = ''

        for i in range(len(longer)):
            if word1 == longer:
                out += longer[i]
            if i < len(shorter):
                out += shorter[i]
            if word2 == longer:
                out += longer[i]
        
        return out