class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        m = min(len(word1), len(word2))
        res = []

        for i in range(m):
            res.append(word1[i])
            res.append(word2[i])
        
        if len(word1) > m:
            res.append(word1[m:])
        if len(word2) > m: # doing else with have 59 ms
            res.append(word2[m:])

        return ''.join(res)