public static bool IsPalindrome(string input)
        {
            int i = 0;
            int j = input.Length - 1;
            while (true)
            {
                if (i > j)
                {
                    return true;
                }
                char a = input[i];
                char b = input[j];
                if (char.ToLower(a) != char.ToLower(b))
                {
                    return false;
                }
                i++;
                j--;
            }
        }